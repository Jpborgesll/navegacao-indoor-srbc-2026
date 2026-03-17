import math
import time
import numpy as np

# AHRS
from ahrs.filters import Madgwick
from ahrs.common.orientation import q2euler

# Kivy
from kivy.app import App
from kivy.clock import Clock
from kivy.uix.boxlayout import BoxLayout
from kivy.uix.floatlayout import FloatLayout
from kivy.uix.label import Label
from kivy.uix.button import Button
from kivy.uix.widget import Widget
from kivy.graphics import Color, Line, Ellipse, Rectangle, InstructionGroup
from kivy.utils import get_color_from_hex

# Sensors
from plyer import accelerometer, gyroscope, compass


def normalize(v):
    v = np.array(v, dtype=float)
    n = np.linalg.norm(v)
    if not np.isfinite(n) or n < 1e-3:
        return None
    return v / n


def wrap_pi(a):
    return (a + math.pi) % (2.0 * math.pi) - math.pi


def ang_diff(a, b):
    # smallest signed difference a-b in [-pi, pi]
    return wrap_pi(a - b)


class AttitudeSystem:
    def __init__(self):
        self.filter = Madgwick(gain=0.25)
        self.q = np.array([1.0, 0.0, 0.0, 0.0])
        self.last_time = None
        self.roll = 0.0
        self.pitch = 0.0
        self.yaw = 0.0
        self.start_time = time.time()

    def update(self, acc, gyro, mag, t):
        if acc is None or gyro is None or mag is None:
            return

        if self.last_time is None:
            self.last_time = t
            return

        dt = t - self.last_time
        self.last_time = t

        dt = max(0.001, min(dt, 0.05))
        self.filter.Dt = dt

        try:
            # Use updateMARG for accelerometer, gyroscope, and magnetometer
            q_new = self.filter.updateMARG(self.q, gyr=gyro, acc=acc, mag=mag)
            if np.all(np.isfinite(q_new)):
                self.q = q_new
                self.roll, self.pitch, self.yaw = q2euler(self.q)
        except Exception:
            pass


class StepDetector:
    def __init__(self, peak_th=0.7, valley_th=0.1, min_interval=0.25, alpha=0.5):
        self.peak_th = peak_th
        self.valley_th = valley_th
        self.min_interval = min_interval
        self.alpha = alpha
        self.last_step_time = 0
        self.a_filt = 0.0
        self.state = "WAIT_PEAK"

    def update(self, acc_raw, t):
        ax, ay, az = acc_raw
        a_mag = math.sqrt(ax * ax + ay * ay + az * az)
        a_dyn = a_mag - 9.81
        self.a_filt = self.alpha * a_dyn + (1.0 - self.alpha) * self.a_filt

        if t - self.last_step_time < self.min_interval:
            return False

        if self.state == "WAIT_PEAK":
            if self.a_filt > self.peak_th:
                self.state = "WAIT_VALLEY"
        elif self.state == "WAIT_VALLEY":
            if self.a_filt < self.valley_th:
                self.last_step_time = t
                self.state = "WAIT_PEAK"
                return True
        return False


class PDRState:
    def __init__(self, step_length=0.7):
        self.x = 0.0
        self.y = 0.0
        self.step_length = step_length
        self.path = [(0.0, 0.0)]

    def reset(self):
        self.x = 0.0
        self.y = 0.0
        self.path = [(0.0, 0.0)]

    def update(self, yaw_rad, step_length=None):
        L = self.step_length if step_length is None else float(step_length)
        dx = L * math.cos(yaw_rad)
        dy = L * math.sin(yaw_rad)
        self.x += dx
        self.y += dy
        self.path.append((self.x, self.y))


class PathWidget(Widget):
    def __init__(self, **kwargs):
        super().__init__(**kwargs)
        self.path = [(0.0, 0.0)]
        self.scale = 100.0  # Increased from 50.0 (pixels per meter)
        self.current_pos = (0.0, 0.0)
        self.current_heading = 0.0
        self.grid_size = 1.0  # 1 meter grid

        with self.canvas.before:
            Color(0.08, 0.08, 0.1)  # Dark navy background
            self.bg_rect = Rectangle(size=self.size, pos=self.pos)

        self.bind(size=self._update_bg, pos=self._update_bg)

    def _update_bg(self, *args):
        self.bg_rect.size = self.size
        self.bg_rect.pos = self.pos
        self.redraw()

    def update_data(self, path, heading):
        self.path = path
        if path:
            self.current_pos = path[-1]
        self.current_heading = heading
        self.redraw()

    def redraw(self):
        self.canvas.clear()

        cx, cy = self.center_x, self.center_y
        x0, y0 = self.path[0] if self.path else (0, 0)

        with self.canvas:
            # Draw Grid
            Color(0.15, 0.15, 0.2)
            grid_px = self.grid_size * self.scale

            # Vertical lines
            start_x = cx % grid_px
            for x in range(int(self.width / grid_px) + 2):
                pos_x = start_x + (x - 1) * grid_px
                Line(points=[pos_x, 0, pos_x, self.height], width=1.5)

            # Horizontal lines
            start_y = cy % grid_px
            for y in range(int(self.height / grid_px) + 2):
                pos_y = start_y + (y - 1) * grid_px
                Line(points=[0, pos_y, self.width, pos_y], width=1.5)

            # Draw Path Glow
            if len(self.path) >= 2:
                Color(0.2, 0.8, 0.2, 0.3)  # Faint green glow
                points = []
                for x, y in self.path:
                    px = cx + (x - x0) * self.scale
                    py = cy + (y - y0) * self.scale
                    points.extend([px, py])
                Line(points=points, width=8, cap="round", joint="round")

                # Draw Main Path Line
                Color(0.4, 1.0, 0.4, 1.0)  # Bright green
                Line(points=points, width=4, cap="round", joint="round")

            # Draw Start Point
            Color(1, 0.2, 0.2)
            Ellipse(pos=(cx - 10, cy - 10), size=(20, 20))

            # Draw Current Position Marker
            curr_x = cx + (self.current_pos[0] - x0) * self.scale
            curr_y = cy + (self.current_pos[1] - y0) * self.scale

            Color(0.2, 0.6, 1.0)  # Light blue
            Ellipse(pos=(curr_x - 15, curr_y - 15), size=(30, 30))

            # Heading Indicator
            Color(1, 1, 1)
            head_len = 40
            hx = curr_x + head_len * math.cos(self.current_heading)
            hy = curr_y + head_len * math.sin(self.current_heading)
            Line(points=[curr_x, curr_y, hx, hy], width=4)


class VisualIMUApp(App):
    def build(self):
        self.sys = AttitudeSystem()
        self.step_detector = StepDetector()
        self.pdr = PDRState(step_length=0.7)

        self.yaw_offset = None
        self.step_count = 0

        # --- Step-length (cadence) state ---
        self.prev_step_time = None
        self.last_step_length = 0.7
        self.total_distance = 0.0

        # --- Yaw accumulation between steps (turn-aware) ---
        self.yaw_sum = 0.0
        self.yaw_count = 0
        self.yaw_last = 0.0
        self.gyro_norm_max = 0.0

        # Yaw-change-based turn detection (wrap-safe)
        self.yaw_ref = None
        self.yaw_change_max = 0.0

        # Root layout
        root = FloatLayout()

        # Path widget background
        self.path_widget = PathWidget()
        root.add_widget(self.path_widget)

        # Top HUD
        self.hud = BoxLayout(
            orientation="horizontal",
            size_hint=(1, None),
            height="140dp",  # Increased from 100dp
            pos_hint={"top": 1},
            padding=[20, 10],
        )

        with self.hud.canvas.before:
            Color(0, 0, 0, 0.7)
            self.hud_rect = Rectangle(size=self.hud.size, pos=self.hud.pos)
        self.hud.bind(size=self._update_hud_rect, pos=self._update_hud_rect)

        def create_stat_label(title):
            box = BoxLayout(orientation="vertical")
            title_lbl = Label(text=title, font_size="18sp", color=(0.8, 0.8, 0.8))
            val_lbl = Label(text="0", font_size="36sp", bold=True)
            box.add_widget(title_lbl)
            box.add_widget(val_lbl)
            return box, val_lbl

        box_steps, self.lbl_steps = create_stat_label("STEPS")
        box_dist, self.lbl_dist = create_stat_label("DISTANCE")
        box_yaw, self.lbl_yaw = create_stat_label("YAW")

        self.hud.add_widget(box_steps)
        self.hud.add_widget(box_dist)
        self.hud.add_widget(box_yaw)

        root.add_widget(self.hud)

        # Reset Button
        self.btn_reset = Button(
            text="RESET PATH",
            size_hint=(None, None),
            size=("220dp", "70dp"),  # Increased from 120x45
            pos_hint={"center_x": 0.5, "y": 0.05},
            background_color=(0.8, 0.2, 0.2, 1),
            background_normal="",
            font_size="20sp",
            bold=True,
        )
        self.btn_reset.bind(on_release=self.reset_path)
        root.add_widget(self.btn_reset)

        return root

    def _update_hud_rect(self, instance, value):
        self.hud_rect.pos = instance.pos
        self.hud_rect.size = instance.size

    def reset_path(self, *args):
        self.pdr.reset()
        self.step_count = 0
        self.yaw_offset = None
        self.path_widget.update_data(self.pdr.path, self.sys.yaw)
        self.prev_step_time = None
        self.last_step_length = 0.7
        self.total_distance = 0.0

        self.yaw_sum = 0.0
        self.yaw_count = 0
        self.yaw_last = 0.0
        self.gyro_norm_max = 0.0
        self.yaw_ref = None
        self.yaw_change_max = 0.0

    def on_start(self):
        try:
            accelerometer.enable()
            gyroscope.enable()
            compass.enable()
        except:
            pass
        Clock.schedule_interval(self.update, 0.02)

    def update(self, dt):
        acc_raw = accelerometer.acceleration
        gyro_raw = gyroscope.rotation
        mag_raw = compass.field

        if acc_raw is None or gyro_raw is None or mag_raw is None:
            return

        acc = normalize(acc_raw)
        mag = normalize(mag_raw)
        if acc is None or mag is None:
            return

        t = time.time()
        gyro = np.radians(np.array(gyro_raw, dtype=float))

        self.sys.update(acc, gyro, mag, t)

        yaw_rad = self.sys.yaw

        # --- accumulate yaw info for the next step event ---
        if math.isfinite(yaw_rad):
            self.yaw_last = yaw_rad
            self.yaw_sum += yaw_rad
            self.yaw_count += 1

        # Track maximum yaw change within the current step interval
        if self.yaw_ref is None:
            self.yaw_ref = yaw_rad
        else:
            dy = abs(ang_diff(yaw_rad, self.yaw_ref))
            if dy > self.yaw_change_max:
                self.yaw_change_max = dy

        if self.step_detector.update(acc_raw, t):
            self.step_count += 1

            # --- Step length from cadence (time between steps) ---
            step_dt = None if self.prev_step_time is None else (t - self.prev_step_time)
            self.prev_step_time = t

            L = 0.7
            if step_dt is not None and 0.25 <= step_dt <= 1.2:
                f = 1.0 / step_dt  # steps / second
                a, b = 0.25, 0.25
                L = a + b * f
                L = max(0.45, min(L, 0.95))
            self.last_step_length = L
            self.total_distance += L

            # --- Turn-aware yaw selection for this step ---
            yaw_avg = (
                (self.yaw_sum / self.yaw_count) if self.yaw_count > 0 else self.yaw_last
            )
            TURN_YAW_THRESH = math.radians(25.0)  # tune 15–35 degrees
            yaw_step = (
                self.yaw_last if self.yaw_change_max > TURN_YAW_THRESH else yaw_avg
            )

            # Reset step-interval accumulators
            self.yaw_sum = 0.0
            self.yaw_count = 0
            
            self.yaw_ref = None
            self.yaw_change_max = 0.0
            
            # Initialize heading reference on first step
            if self.yaw_offset is None:
                self.yaw_offset = yaw_step

            yaw_rel = yaw_step - self.yaw_offset
            yaw_for_pdr = yaw_rel + math.pi / 2
            self.pdr.update(yaw_for_pdr, step_length=L)

        # Update UI
        self.lbl_steps.text = str(self.step_count)
        self.lbl_dist.text = f"{self.total_distance:.1f} m"
        self.lbl_yaw.text = f"{math.degrees(yaw_rad) % 360:.0f}°"

        # Update Map
        display_yaw = (
            (yaw_rad - self.yaw_offset + math.pi / 2)
            if self.yaw_offset is not None
            else (yaw_rad + math.pi / 2)
        )
        self.path_widget.update_data(self.pdr.path, display_yaw)

    def on_stop(self):
        try:
            accelerometer.disable()
            gyroscope.disable()
            compass.disable()
        except:
            pass


if __name__ == "__main__":
    VisualIMUApp().run()
