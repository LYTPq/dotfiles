local var = require("util.variable")

hl.config({
  input = {
    kb_layout = "us, ru",
    kb_options = "grp:caps_toggle",
    float_switch_override_focus = 0,
    follow_mouse = 1,
    mouse_refocus = false,
    numlock_by_default = false,
    sensitivity = 0.0,
    repeat_delay = 200,
    repeat_rate = 40,
    touchpad = {
      natural_scroll = true,
      disable_while_typing = true,
      scroll_factor = 0.5,
      tap_to_click = true,
    },
  },
  cursor = {
    no_warps = true,
    inactive_timeout = 10,
  },
  gestures = {
    workspace_swipe_touch = true,
    workspace_swipe_distance = 300,
    workspace_swipe_invert = true,
    workspace_swipe_min_speed_to_force = 5,
    workspace_swipe_cancel_ratio = 0.2,
    workspace_swipe_create_new = true,
    workspace_swipe_forever = true,
  },
})

hl.gesture(3, "horizontal", "workspace")
hl.gesture(3, "up", "dispatcher", "exec", var.scripts.launcher)
hl.gesture(3, "down", "dispatcher", "exec", var.scripts.powermenu)

hl.workspace({
  name = "special:window",
  gapsin = 3,
  gapsout = "120 240 120 240",
})
hl.gesture(4, "vertical", "dispatcher", "togglespecialworkspace", "window")
