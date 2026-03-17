package com.example.pdrmadgwick

import androidx.compose.foundation.Canvas
import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Search
import androidx.compose.material.icons.filled.Refresh
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.geometry.Offset
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.Path
import androidx.compose.ui.graphics.drawscope.Stroke
import androidx.compose.ui.graphics.drawscope.rotate
import androidx.compose.ui.graphics.drawscope.withTransform
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import kotlin.math.cos
import kotlin.math.sin

import androidx.compose.foundation.gestures.detectTransformGestures
import androidx.compose.ui.input.pointer.pointerInput
import androidx.compose.ui.graphics.drawscope.drawIntoCanvas
import androidx.compose.ui.graphics.nativeCanvas
import android.graphics.Paint
import android.graphics.Typeface
import androidx.compose.runtime.mutableFloatStateOf

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun NavigationScreen(viewModel: NavigationViewModel) {
    val uiState by viewModel.uiState.collectAsState()
    var searchQuery by remember { mutableStateOf("") }

    Scaffold(
        topBar = {
            TopAppBar(
                title = {
                    TextField(
                        value = searchQuery,
                        onValueChange = { searchQuery = it },
                        placeholder = { Text("Buscar salas ou POIs...") },
                        modifier = Modifier.fillMaxWidth(),
                        trailingIcon = {
                            IconButton(onClick = { viewModel.search(searchQuery) }) {
                                Icon(Icons.Default.Search, "Buscar")
                            }
                        },
                        colors = TextFieldDefaults.colors(
                            unfocusedContainerColor = Color.Transparent,
                            focusedContainerColor = Color.Transparent
                        )
                    )
                },
                actions = {
                    IconButton(onClick = { viewModel.syncSpace() }) {
                        Icon(Icons.Default.Refresh, "Sincronizar")
                        if (uiState.isSyncing) {
                            CircularProgressIndicator(
                                modifier = Modifier.size(24.dp),
                                strokeWidth = 2.dp
                            )
                        }
                    }
                }
            )
        }
    ) { padding ->
        Box(modifier = Modifier.padding(padding).fillMaxSize()) {
            PdrMap(
                path = uiState.path,
                routePath = uiState.routePath,
                units = uiState.units,
                edges = uiState.edges,
                pois = uiState.pois,
                heading = uiState.heading,
                modifier = Modifier.fillMaxSize()
            )

            if (uiState.searchResults.isNotEmpty() || uiState.isSearching) {
                Card(
                    modifier = Modifier
                        .fillMaxWidth()
                        .heightIn(max = 300.dp)
                        .padding(16.dp),
                    elevation = CardDefaults.cardElevation(8.dp)
                ) {
                    if (uiState.isSearching) {
                        CircularProgressIndicator(modifier = Modifier.padding(16.dp).align(Alignment.CenterHorizontally))
                    } else {
                        LazyColumn {
                            items(uiState.searchResults) { result ->
                                ListItem(
                                    headlineContent = { Text(result.label) },
                                    supportingContent = { Text(result.kind) },
                                    modifier = Modifier
                                        .clickable { viewModel.onResultSelected(result) }
                                        .background(MaterialTheme.colorScheme.surface)
                                )
                            }
                        }
                    }
                }
            }

            Surface(
                modifier = Modifier
                    .align(Alignment.BottomCenter)
                    .padding(24.dp)
                    .fillMaxWidth(),
                color = MaterialTheme.colorScheme.primaryContainer,
                shape = RoundedCornerShape(16.dp),
                shadowElevation = 4.dp
            ) {
                Row(
                    modifier = Modifier.padding(16.dp),
                    horizontalArrangement = Arrangement.SpaceAround
                ) {
                    HudItem("Passos", uiState.steps.toString())
                    HudItem("Distância", String.format("%.1f m", uiState.distance))
                    HudItem("Yaw", String.format("%.0f°", uiState.yawDeg))
                }
            }
        }
    }
}

@Composable
fun HudItem(label: String, value: String) {
    Column(horizontalAlignment = Alignment.CenterHorizontally) {
        Text(label, fontSize = 12.sp, color = MaterialTheme.colorScheme.onPrimaryContainer)
        Text(value, fontSize = 18.sp, fontWeight = FontWeight.Bold, color = MaterialTheme.colorScheme.onPrimaryContainer)
    }
}

@Composable
fun PdrMap(
    path: List<android.graphics.PointF>,
    routePath: List<android.graphics.PointF>,
    units: List<MapPolygon>,
    edges: List<MapLine>,
    pois: List<MapPoint>,
    heading: Double,
    modifier: Modifier
) {
    var viewOffset by remember { mutableStateOf(Offset.Zero) }
    var viewScale by remember { mutableFloatStateOf(80f) }
    var viewRotation by remember { mutableFloatStateOf(0f) }

    val backgroundColor = Color(0xFF121212) 
    val primaryColor = Color(0xFF64FFDA)    
    val routeColor = Color(0xFF448AFF)      
    val unitColor = Color(0xFF383838)       
    val unitBorderColor = Color(0xFF808080) 
    val blockedUnitColor = Color(0xFF5D4037)
    val edgeColor = Color(0xFF7C4DFF)       
    val poiColor = Color(0xFFFFD740)        

    val textPaint = remember {
        Paint().apply {
            color = android.graphics.Color.WHITE
            textSize = 40f // Larger text
            textAlign = Paint.Align.CENTER
            typeface = Typeface.create(Typeface.DEFAULT, Typeface.BOLD)
            setShadowLayer(5f, 0f, 0f, android.graphics.Color.BLACK) 
        }
    }

    Canvas(
        modifier = modifier
            .background(backgroundColor)
            .pointerInput(Unit) {
                detectTransformGestures { _, pan, zoom, rotation ->
                    viewScale *= zoom
                    viewScale = viewScale.coerceIn(20f, 400f)
                    viewOffset += pan
                    viewRotation += rotation
                }
            }
    ) {
        val centerX = size.width / 2f
        val centerY = size.height / 2f
        
        withTransform({
            translate(viewOffset.x, viewOffset.y)
            rotate(viewRotation, pivot = Offset(centerX, centerY))
        }) {
            val cx = centerX
            val cy = centerY
            val scale = viewScale

            units.forEach { unit ->
                if (unit.points.isNotEmpty()) {
                    val uPath = Path()
                    uPath.moveTo(cx + unit.points[0].x * scale, cy - unit.points[0].y * scale)
                    unit.points.forEach { pt ->
                        uPath.lineTo(cx + pt.x * scale, cy - pt.y * scale)
                    }
                    uPath.close()
                    drawPath(
                        path = uPath,
                        color = if (unit.isBlocked) blockedUnitColor else unitColor
                    )
                    drawPath(
                        path = uPath,
                        color = unitBorderColor,
                        style = Stroke(width = 6f)
                    )

                    // Rótulo da Unidade
                    val avgX = unit.points.map { it.x }.average().toFloat()
                    val avgY = unit.points.map { it.y }.average().toFloat()
                    val tx = cx + avgX * scale
                    val ty = cy - avgY * scale

                    rotate(-viewRotation, pivot = Offset(tx, ty)) {
                        drawIntoCanvas { canvas ->
                            canvas.nativeCanvas.drawText(
                                unit.name.uppercase(),
                                tx,
                                ty,
                                textPaint
                            )
                        }
                    }
                }
            }

            edges.forEach { edge ->
                if (edge.points.size >= 2) {
                    val ePath = Path()
                    ePath.moveTo(cx + edge.points[0].x * scale, cy - edge.points[0].y * scale)
                    for (i in 1 until edge.points.size) {
                        ePath.lineTo(cx + edge.points[i].x * scale, cy - edge.points[i].y * scale)
                    }
                    drawPath(ePath, color = edgeColor, style = Stroke(width = 5f))
                }
            }

            if (routePath.isNotEmpty()) {
                val rPath = Path()
                rPath.moveTo(cx + routePath[0].x * scale, cy - routePath[0].y * scale)
                routePath.forEach { pt ->
                    rPath.lineTo(cx + pt.x * scale, cy - pt.y * scale)
                }
                drawPath(rPath, color = routeColor, style = Stroke(width = 12f))
            }

            if (path.size > 1) {
                val pPath = Path()
                pPath.moveTo(cx, cy)
                path.forEach { pt ->
                    pPath.lineTo(cx + pt.x * scale, cy - pt.y * scale)
                }
                drawPath(pPath, color = primaryColor, style = Stroke(width = 16f))
            }

            pois.forEach { poi ->
                val px = cx + poi.position.x * scale
                val py = cy - poi.position.y * scale
                drawCircle(poiColor, radius = 12f, center = Offset(px, py))
                
                rotate(-viewRotation, pivot = Offset(px, py)) {
                    drawIntoCanvas { canvas ->
                        canvas.nativeCanvas.drawText(poi.label, px, py - 20f, textPaint)
                    }
                }
            }

            val last = path.lastOrNull() ?: android.graphics.PointF(0f, 0f)
            val currX = cx + last.x * scale
            val currY = cy - last.y * scale
            
            drawCircle(color = Color.Red.copy(alpha = 0.3f), radius = 30f, center = Offset(currX, currY))
            drawCircle(color = Color.Red, radius = 15f, center = Offset(currX, currY))
            
            val lineLen = 70f
            drawLine(
                color = Color.White,
                start = Offset(currX, currY),
                end = Offset(
                    currX + lineLen * cos(heading).toFloat(),
                    currY - lineLen * sin(heading).toFloat()
                ),
                strokeWidth = 8f
            )
        }
    }
}
