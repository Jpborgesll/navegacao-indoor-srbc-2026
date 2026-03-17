package com.example.pdrmadgwick

import android.graphics.PointF
import kotlin.math.*

class AttitudeSystem {
    private val filter = MadgwickMARG(beta = 0.25)
    private var lastTimeSec: Double? = null
    private val q = DoubleArray(4).apply { this[0] = 1.0; this[1]=0.0; this[2]=0.0; this[3]=0.0 }

    var roll: Double = 0.0; private set
    var pitch: Double = 0.0; private set
    var yaw: Double = 0.0; private set

    fun update(acc: FloatArray, gyro: FloatArray, mag: FloatArray, tSec: Double) {
        val lt = lastTimeSec
        if (lt == null) { lastTimeSec = tSec; return }
        var dt = tSec - lt
        lastTimeSec = tSec
        dt = dt.coerceIn(0.001, 0.05)

        filter.update(q, gyro, acc, mag, dt)

        val e = qToEuler(q)
        roll = e[0]; pitch = e[1]; yaw = e[2]
    }

    private fun qToEuler(q: DoubleArray): DoubleArray {
        val w = q[0]; val x = q[1]; val y = q[2]; val z = q[3]
        val roll = atan2(2.0 * (w*x + y*z), 1.0 - 2.0 * (x*x + y*y))
        val sinp = 2.0 * (w*y - z*x)
        val pitch = if (abs(sinp) >= 1.0) Math.copySign(Math.PI/2.0, sinp) else asin(sinp)
        val yaw = atan2(2.0 * (w*z + x*y), 1.0 - 2.0 * (y*y + z*z))
        return doubleArrayOf(roll, pitch, yaw)
    }
}

class MadgwickMARG(private val beta: Double) {
    fun update(q: DoubleArray, gyro: FloatArray, acc: FloatArray, mag: FloatArray, dt: Double) {
        var qw = q[0]; var qx = q[1]; var qy = q[2]; var qz = q[3]
        val gx = gyro[0].toDouble(); val gy = gyro[1].toDouble(); val gz = gyro[2].toDouble()
        val ax = acc[0].toDouble(); val ay = acc[1].toDouble(); val az = acc[2].toDouble()
        val mx = mag[0].toDouble(); val my = mag[1].toDouble(); val mz = mag[2].toDouble()

        val _2qw = 2.0*qw; val _2qx = 2.0*qx; val _2qy = 2.0*qy; val _2qz = 2.0*qz
        val qwqw = qw*qw; val qxqx = qx*qx; val qyqy = qy*qy; val qzqz = qz*qz

        val hx = mx*(qwqw + qxqx - qyqy - qzqz) + my*(2.0*(qx*qy - qw*qz)) + mz*(2.0*(qx*qz + qw*qy))
        val hy = mx*(2.0*(qx*qy + qw*qz)) + my*(qwqw - qxqx + qyqy - qzqz) + mz*(2.0*(qy*qz - qw*qx))
        val _2bx = sqrt(hx*hx + hy*hy)
        val _2bz = mx*(2.0*(qx*qz - qw*qy)) + my*(2.0*(qy*qz + qw*qx)) + mz*(qwqw - qxqx - qyqy + qzqz)
        val _4bx = 2.0*_2bx; val _4bz = 2.0*_2bz

        val s0 = -_2qy*(2.0*(qx*qz - qw*qy) - ax) + _2qx*(2.0*(qw*qx + qy*qz) - ay) - _2bz*qy*(_2bx*(0.5 - qyqy - qzqz) + _2bz*(qx*qz - qw*qy) - mx) + (-_2bx*qz + _2bz*qx)*(_2bx*(qx*qy - qw*qz) + _2bz*(qw*qx + qy*qz) - my) + _2bx*qy*(_2bx*(qw*qy + qx*qz) + _2bz*(0.5 - qxqx - qyqy) - mz)
        val s1 = _2qz*(2.0*(qx*qz - qw*qy) - ax) + _2qw*(2.0*(qw*qx + qy*qz) - ay) - 4.0*qx*(2.0*(0.5 - qxqx - qyqy) - az) + _2bz*qz*(_2bx*(0.5 - qyqy - qzqz) + _2bz*(qx*qz - qw*qy) - mx) + (_2bx*qy + _2bz*qw)*(_2bx*(qx*qy - qw*qz) + _2bz*(qw*qx + qy*qz) - my) + (_2bx*qz - _4bz*qx)*(_2bx*(qw*qy + qx*qz) + _2bz*(0.5 - qxqx - qyqy) - mz)
        val s2 = -_2qw*(2.0*(qx*qz - qw*qy) - ax) + _2qz*(2.0*(qw*qx + qy*qz) - ay) - 4.0*qy*(2.0*(0.5 - qxqx - qyqy) - az) + (-_4bx*qy - _2bz*qw)*(_2bx*(0.5 - qyqy - qzqz) + _2bz*(qx*qz - qw*qy) - mx) + (_2bx*qx + _2bz*qz)*(_2bx*(qx*qy - qw*qz) + _2bz*(qw*qx + qy*qz) - my) + (_2bx*qw - _4bz*qy)*(_2bx*(qw*qy + qx*qz) + _2bz*(0.5 - qxqx - qyqy) - mz)
        val s3 = _2qx*(2.0*(qx*qz - qw*qy) - ax) + _2qy*(2.0*(qw*qx + qy*qz) - ay) + (-_4bx*qz + _2bz*qx)*(_2bx*(0.5 - qyqy - qzqz) + _2bz*(qx*qz - qw*qy) - mx) + (-_2bx*qw + _2bz*qy)*(_2bx*(qx*qy - qw*qz) + _2bz*(qw*qx + qy*qz) - my) + _2bx*qx*(_2bx*(qw*qy + qx*qz) + _2bz*(0.5 - qxqx - qyqy) - mz)

        val normS = sqrt(s0*s0 + s1*s1 + s2*s2 + s3*s3)
        val ns0 = if (normS > 1e-9) s0/normS else 0.0
        val ns1 = if (normS > 1e-9) s1/normS else 0.0
        val ns2 = if (normS > 1e-9) s2/normS else 0.0
        val ns3 = if (normS > 1e-9) s3/normS else 0.0

        val qDot0 = 0.5 * (-qx*gx - qy*gy - qz*gz) - beta * ns0
        val qDot1 = 0.5 * ( qw*gx + qy*gz - qz*gy) - beta * ns1
        val qDot2 = 0.5 * ( qw*gy - qx*gz + qz*gx) - beta * ns2
        val qDot3 = 0.5 * ( qw*gz + qx*gy - qy*gx) - beta * ns3

        qw += qDot0 * dt; qx += qDot1 * dt; qy += qDot2 * dt; qz += qDot3 * dt
        val normQ = sqrt(qw*qw + qx*qx + qy*qy + qz*qz)
        if (normQ > 1e-12) { q[0] = qw/normQ; q[1] = qx/normQ; q[2] = qy/normQ; q[3] = qz/normQ }
    }
}

class StepDetector(private val peakTh: Double, private val valleyTh: Double, private val minIntervalSec: Double, private val alpha: Double) {
    private var lastStepTime = 0.0
    private var aFilt = 0.0
    private var state = 0 // 0: WAIT_PEAK, 1: WAIT_VALLEY

    fun update(accRaw: FloatArray, tSec: Double): Boolean {
        val aMag = sqrt(accRaw[0]*accRaw[0] + accRaw[1]*accRaw[1] + accRaw[2]*accRaw[2])
        val aDyn = aMag - 9.81
        aFilt = alpha * aDyn + (1.0 - alpha) * aFilt
        if (tSec - lastStepTime < minIntervalSec) return false
        return when (state) {
            0 -> { if (aFilt > peakTh) { state = 1 }; false }
            1 -> { if (aFilt < valleyTh) { lastStepTime = tSec; state = 0; true } else false }
            else -> false
        }
    }
}

class PDRState(val stepLength: Double) {
    var x = 0.0; var y = 0.0
    val path = mutableListOf(PointF(0f, 0f))
    fun update(yawRad: Double, L: Double) {
        x += L * cos(yawRad); y += L * sin(yawRad)
        path.add(PointF(x.toFloat(), y.toFloat()))
    }
}
