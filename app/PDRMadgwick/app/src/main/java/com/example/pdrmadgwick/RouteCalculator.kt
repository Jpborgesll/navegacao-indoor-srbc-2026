package com.example.pdrmadgwick

import android.graphics.PointF
import java.util.PriorityQueue
import kotlin.math.roundToInt
import kotlin.math.sqrt

object RouteCalculator {

    data class Node(val idX: Int, val idY: Int) {
        val x: Float get() = idX / 100f
        val y: Float get() = idY / 100f

        fun distanceTo(other: Node): Float {
            val dx = this.x - other.x
            val dy = this.y - other.y
            return sqrt(dx * dx + dy * dy)
        }
    }

    private fun PointF.toNode(): Node {
        return Node((this.x * 100f).roundToInt(), (this.y * 100f).roundToInt())
    }

    fun calculateRoute(
        startPoint: PointF,
        endPoint: PointF,
        edges: List<MapLine>,
        userRestrictionLevel: Int = 0,
        accessibility: Boolean = false
    ): List<PointF> {
        val graph = mutableMapOf<Node, MutableList<Pair<Node, Float>>>()

        for (edge in edges) {
            if (!edge.isWalkable) continue
            if (edge.restrictionLevel > userRestrictionLevel) continue
            if (accessibility && !edge.isAccessible) continue
            val points = edge.points
            if (points.size < 2) continue

            for (i in 0 until points.size - 1) {
                val n1 = points[i].toNode()
                val n2 = points[i + 1].toNode()
                val dist = n1.distanceTo(n2)

                graph.getOrPut(n1) { mutableListOf() }.add(n2 to dist)
                graph.getOrPut(n2) { mutableListOf() }.add(n1 to dist) // Undirected graph
            }
        }

        if (graph.isEmpty()) return emptyList()

        val allNodes = graph.keys
        val startNodeReq = startPoint.toNode()
        val endNodeReq = endPoint.toNode()

        val startNodes = allNodes.sortedBy { it.distanceTo(startNodeReq) }.take(5)
        val endNodes = allNodes.sortedBy { it.distanceTo(endNodeReq) }.take(5)

        if (startNodes.isEmpty() || endNodes.isEmpty()) return emptyList()

        var bestTotalCost = Float.POSITIVE_INFINITY
        var bestPath = emptyList<PointF>()

        for (sNode in startNodes) {
            val distStart = sNode.distanceTo(startNodeReq)

            val distances = mutableMapOf<Node, Float>().withDefault { Float.POSITIVE_INFINITY }
            val previous = mutableMapOf<Node, Node>()
            val pq = PriorityQueue<Pair<Node, Float>>(compareBy { it.second })

            distances[sNode] = 0f
            pq.add(sNode to 0f)

            while (pq.isNotEmpty()) {
                val (current, currentDist) = pq.poll()

                if (currentDist > distances.getValue(current)) continue

                val neighbors = graph[current] ?: emptyList()
                for ((neighbor, weight) in neighbors) {
                    val newDist = currentDist + weight
                    if (newDist < distances.getValue(neighbor)) {
                        distances[neighbor] = newDist
                        previous[neighbor] = current
                        pq.add(neighbor to newDist)
                    }
                }
            }

            for (eNode in endNodes) {
                if (distances.containsKey(eNode)) {
                    val routeCost = distances.getValue(eNode)
                    val distEnd = eNode.distanceTo(endNodeReq)
                    val totalCost = distStart + routeCost + distEnd

                    if (totalCost < bestTotalCost) {
                        bestTotalCost = totalCost

                        val path = mutableListOf<PointF>()
                        var curr: Node? = eNode
                        while (curr != null) {
                            path.add(PointF(curr.x, curr.y))
                            curr = previous[curr]
                        }
                        path.reverse()
                        bestPath = path
                    }
                }
            }
        }

        if (bestPath.isEmpty()) return emptyList()

        val fullPath = mutableListOf<PointF>()
        fullPath.add(startPoint)
        fullPath.addAll(bestPath)
        fullPath.add(endPoint)

        return fullPath
    }
}
