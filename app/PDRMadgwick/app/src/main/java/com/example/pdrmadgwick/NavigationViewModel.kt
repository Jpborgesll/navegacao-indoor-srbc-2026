package com.example.pdrmadgwick

import android.content.Context
import android.graphics.PointF
import android.hardware.Sensor
import android.hardware.SensorEvent
import android.hardware.SensorEventListener
import android.hardware.SensorManager
import android.os.SystemClock
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.jakewharton.retrofit2.converter.kotlinx.serialization.asConverterFactory
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.flow.update
import kotlinx.coroutines.launch
import kotlinx.serialization.json.*
import okhttp3.MediaType.Companion.toMediaType
import okhttp3.OkHttpClient
import retrofit2.Retrofit
import kotlin.math.*

data class MapPolygon(val points: List<PointF>, val name: String, val isBlocked: Boolean)
data class MapLine(val points: List<PointF>, val isWalkable: Boolean, val isAccessible: Boolean, val restrictionLevel: Int)
data class MapPoint(val position: PointF, val label: String, val kind: String)

data class NavUiState(
    val steps: Int = 0,
    val distance: Double = 0.0,
    val yawDeg: Double = 0.0,
    val path: List<PointF> = listOf(PointF(0f, 0f)),
    val routePath: List<PointF> = emptyList(), 
    val units: List<MapPolygon> = emptyList(),
    val edges: List<MapLine> = emptyList(),
    val pois: List<MapPoint> = emptyList(),
    val heading: Double = 0.0,
    val isSearching: Boolean = false,
    val searchResults: List<SearchResult> = emptyList(),
    val currentSpaceId: Int = 1,
    val isSyncing: Boolean = false
)

class NavigationViewModel : ViewModel(), SensorEventListener {

    private val _uiState = MutableStateFlow(NavUiState())
    val uiState: StateFlow<NavUiState> = _uiState.asStateFlow()

    // Posição inicial fixa fornecida pelo usuário
    private val START_LON = -49.26670650
    private val START_LAT = -16.60360113

    private lateinit var sensorManager: SensorManager
    private val ahrs = AttitudeSystem()
    private val stepDetector = StepDetector(1.2, 0.2, 0.4, 0.2)
    private val pdr = PDRState(0.7)

    private val accRaw = FloatArray(3)
    private val gyrRaw = FloatArray(3)
    private val magRaw = FloatArray(3)
    private var hasAcc = false; private var hasGyr = false; private var hasMag = false

    private var yawOffset: Double? = null
    private var prevStepTimeSec: Double? = null
    private var yawSum = 0.0; private var yawCount = 0; private var yawLast = 0.0
    private var yawRef: Double? = null; private var yawChangeMax = 0.0

    private val api: NavIndoorApi by lazy {
        val json = Json { ignoreUnknownKeys = true }
        val contentType = "application/json".toMediaType()
        Retrofit.Builder()
            .baseUrl("http://192.168.0.156:8000/")
            .client(OkHttpClient())
            .addConverterFactory(json.asConverterFactory(contentType))
            .build()
            .create(NavIndoorApi::class.java)
    }

    fun initSensors(context: Context) {
        sensorManager = context.getSystemService(Context.SENSOR_SERVICE) as SensorManager
        val accel = sensorManager.getDefaultSensor(Sensor.TYPE_ACCELEROMETER)
        val gyro = sensorManager.getDefaultSensor(Sensor.TYPE_GYROSCOPE)
        val mag = sensorManager.getDefaultSensor(Sensor.TYPE_MAGNETIC_FIELD)

        accel?.let { sensorManager.registerListener(this, it, SensorManager.SENSOR_DELAY_GAME) }
        gyro?.let { sensorManager.registerListener(this, it, SensorManager.SENSOR_DELAY_GAME) }
        mag?.let { sensorManager.registerListener(this, it, SensorManager.SENSOR_DELAY_GAME) }
    }

    fun search(query: String) {
        viewModelScope.launch {
            _uiState.update { it.copy(isSearching = true) }
            try {
                val results = api.search(_uiState.value.currentSpaceId, query)
                _uiState.update { it.copy(searchResults = results, isSearching = false) }
            } catch (e: Exception) {
                _uiState.update { it.copy(isSearching = false) }
            }
        }
    }

    fun onResultSelected(result: SearchResult) {
        viewModelScope.launch {
            _uiState.update { it.copy(isSearching = false, searchResults = emptyList()) }
            try {
                val entryPoint = result.entry_point?.jsonObject ?: return@launch
                val coords = entryPoint["coordinates"]?.jsonArray ?: return@launch
                val endLon = coords[0].jsonPrimitive.double
                val endLat = coords[1].jsonPrimitive.double

                val startPoint = PointF(pdr.x.toFloat(), pdr.y.toFloat())
                val endPoint = convertToMeters(endLon, endLat)

                val routePoints = RouteCalculator.calculateRoute(
                    startPoint = startPoint,
                    endPoint = endPoint,
                    edges = _uiState.value.edges,
                    userRestrictionLevel = 0,
                    accessibility = false
                )

                _uiState.update { it.copy(routePath = routePoints) }
            } catch (e: Exception) {
                e.printStackTrace()
            }
        }
    }

    private fun parseAndSetRoute(geojson: JsonElement) {
        try {
            val feature = geojson.jsonObject
            val coords = feature["coordinates"]?.jsonArray ?: return
            val points = parseCoordsArray(coords)
            _uiState.update { it.copy(routePath = points) }
        } catch (e: Exception) {
            e.printStackTrace()
        }
    }

    private fun convertToMeters(lon: Double, lat: Double): PointF {
        val lonFactor = 111320.0 * cos(Math.toRadians(START_LAT))
        val latFactor = 110574.0
        val dx = (lon - START_LON) * lonFactor
        val dy = (lat - START_LAT) * latFactor
        return PointF(dx.toFloat(), dy.toFloat())
    }

    private fun parseCoordsArray(coords: JsonArray): List<PointF> {
        val points = mutableListOf<PointF>()
        for (i in 0 until coords.size) {
            val pair = coords[i].jsonArray
            val lon = pair[0].jsonPrimitive.double
            val lat = pair[1].jsonPrimitive.double
            points.add(convertToMeters(lon, lat))
        }
        return points
    }

    fun syncSpace() {
        viewModelScope.launch {
            _uiState.update { it.copy(isSyncing = true) }
            try {
                val res = api.syncSpace(_uiState.value.currentSpaceId)
                
                val units = parseUnits(res.units)
                val edges = parseEdges(res.edges)
                val pois = parsePois(res.pois)

                _uiState.update { it.copy(
                    units = units,
                    edges = edges,
                    pois = pois,
                    isSyncing = false
                ) }
            } catch (e: Exception) {
                e.printStackTrace()
                _uiState.update { it.copy(isSyncing = false) }
            }
        }
    }

    private fun parseUnits(unitsJson: JsonElement): List<MapPolygon> {
        val features = unitsJson.jsonObject["features"]?.jsonArray ?: return emptyList()
        return features.mapNotNull { feat ->
            val fObj = feat.jsonObject
            val geom = fObj["geometry"]?.jsonObject ?: return@mapNotNull null
            val props = fObj["properties"]?.jsonObject ?: return@mapNotNull null
            
            val coords = geom["coordinates"]?.jsonArray?.get(0)?.jsonArray ?: return@mapNotNull null
            val points = parseCoordsArray(coords)
            
            MapPolygon(
                points = points,
                name = props["name"]?.jsonPrimitive?.content ?: "Unidade",
                isBlocked = props["is_blocked"]?.jsonPrimitive?.boolean ?: false
            )
        }
    }

    private fun parseEdges(edgesJson: JsonElement): List<MapLine> {
        val features = edgesJson.jsonObject["features"]?.jsonArray ?: return emptyList()
        return features.mapNotNull { feat ->
            val fObj = feat.jsonObject
            val geom = fObj["geometry"]?.jsonObject ?: return@mapNotNull null
            val props = fObj["properties"]?.jsonObject ?: return@mapNotNull null
            
            val coords = geom["coordinates"]?.jsonArray ?: return@mapNotNull null
            val points = parseCoordsArray(coords)
            
            MapLine(
                points = points,
                isWalkable = props["is_walkable"]?.jsonPrimitive?.boolean ?: true,
                isAccessible = props["is_accessible"]?.jsonPrimitive?.boolean ?: true,
                restrictionLevel = props["restriction_level"]?.jsonPrimitive?.int ?: 0
            )
        }
    }

    private fun parsePois(poisJson: JsonElement): List<MapPoint> {
        val features = poisJson.jsonObject["features"]?.jsonArray ?: return emptyList()
        return features.mapNotNull { feat ->
            val fObj = feat.jsonObject
            val geom = fObj["geometry"]?.jsonObject ?: return@mapNotNull null
            val props = fObj["properties"]?.jsonObject ?: return@mapNotNull null
            
            val coords = geom["coordinates"]?.jsonArray ?: return@mapNotNull null
            val lon = coords[0].jsonPrimitive.double
            val lat = coords[1].jsonPrimitive.double
            
            MapPoint(
                position = convertToMeters(lon, lat),
                label = props["poi_type"]?.jsonPrimitive?.content ?: "POI",
                kind = "poi"
            )
        }
    }

    override fun onSensorChanged(event: SensorEvent) {
        when (event.sensor.type) {
            Sensor.TYPE_ACCELEROMETER -> {
                System.arraycopy(event.values, 0, accRaw, 0, 3)
                hasAcc = true
            }
            Sensor.TYPE_GYROSCOPE -> {
                System.arraycopy(event.values, 0, gyrRaw, 0, 3)
                hasGyr = true
            }
            Sensor.TYPE_MAGNETIC_FIELD -> {
                System.arraycopy(event.values, 0, magRaw, 0, 3)
                hasMag = true
            }
        }

        if (!hasAcc || !hasGyr || !hasMag) return

        val tSec = SystemClock.elapsedRealtimeNanos() * 1e-9
        val accN = normalize3(accRaw) ?: return
        val magN = normalize3(magRaw) ?: return

        ahrs.update(accN, gyrRaw, magN, tSec)
        val yawRad = ahrs.yaw

        if (yawRad.isFinite()) {
            yawLast = yawRad; yawSum += yawRad; yawCount += 1
        }

        if (yawRef == null) yawRef = yawRad else {
            val dy = abs(wrapPi(yawRad - yawRef!!))
            if (dy > yawChangeMax) yawChangeMax = dy
        }

        if (stepDetector.update(accRaw, tSec)) {
            val stepDt = prevStepTimeSec?.let { tSec - it }
            prevStepTimeSec = tSec

            var L = 0.7
            if (stepDt != null && stepDt in 0.25..1.2) {
                L = (0.25 + 0.25 * (1.0 / stepDt)).coerceIn(0.45, 0.95)
            }

            val yawAvg = if (yawCount > 0) (yawSum / yawCount) else yawLast
            val turnYawThresh = Math.toRadians(25.0)
            val yawStep = if (yawChangeMax > turnYawThresh) yawLast else yawAvg

            yawSum = 0.0; yawCount = 0; yawRef = null; yawChangeMax = 0.0

            if (yawOffset == null) yawOffset = yawStep
            pdr.update(yawStep - yawOffset!! + Math.PI / 2.0, L)

            _uiState.update { state ->
                state.copy(
                    steps = state.steps + 1,
                    distance = state.distance + L,
                    path = pdr.path.toList()
                )
            }
        }

        val displayYaw = if (yawOffset != null) {
            (yawRad - yawOffset!! + Math.PI / 2.0)
        } else {
            (yawRad + Math.PI / 2.0)
        }

        _uiState.update { it.copy(
            heading = displayYaw,
            yawDeg = ((Math.toDegrees(yawRad) % 360.0) + 360.0) % 360.0
        )}
    }

    override fun onAccuracyChanged(sensor: Sensor?, accuracy: Int) {}
    override fun onCleared() { super.onCleared(); sensorManager.unregisterListener(this) }
    private fun normalize3(v: FloatArray): FloatArray? {
        val n = sqrt(v[0]*v[0] + v[1]*v[1] + v[2]*v[2])
        if (!n.isFinite() || n < 1e-3) return null
        return floatArrayOf(v[0]/n.toFloat(), v[1]/n.toFloat(), v[2]/n.toFloat())
    }
    private fun wrapPi(a: Double): Double = (a + Math.PI) % (2.0 * Math.PI) - Math.PI
}
