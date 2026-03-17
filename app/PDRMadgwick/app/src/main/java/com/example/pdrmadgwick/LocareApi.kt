package com.example.pdrmadgwick

import kotlinx.serialization.Serializable
import kotlinx.serialization.json.JsonElement
import retrofit2.http.GET
import retrofit2.http.POST
import retrofit2.http.Body
import retrofit2.http.Query
import retrofit2.http.Path

@Serializable
data class SpaceVersion(val space_id: Int, val space_version: String)

@Serializable
data class SearchResult(
    val kind: String,
    val id: Int,
    val label: String,
    val entry_point: JsonElement? = null
)

@Serializable
data class SyncResponse(
    val space_id: Int,
    val space_version: String,
    val units: JsonElement,
    val edges: JsonElement,
    val pois: JsonElement,
    val beacons: JsonElement
)

@Serializable
data class RouteRequest(
    val space_id: Int,
    val start_x: Double,
    val start_y: Double,
    val end_x: Double,
    val end_y: Double,
    val user_restriction_level: Int = 0,
    val accessibility: Boolean = false
)

@Serializable
data class RouteResponse(
    val total_cost: Double,
    val geojson: JsonElement
)

interface LocareApi {
    @GET("spaces/{id}/version")
    suspend fun getVersion(@Path("id") id: Int): SpaceVersion

    @GET("spaces/{id}/sync")
    suspend fun syncSpace(@Path("id") id: Int): SyncResponse

    @GET("search")
    suspend fun search(
        @Query("space_id") spaceId: Int,
        @Query("q") query: String
    ): List<SearchResult>

    @POST("route/calculate")
    suspend fun calculateRoute(@Body request: RouteRequest): RouteResponse
}
