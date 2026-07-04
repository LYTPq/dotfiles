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

hl.gesture({
  fingers = 3,
  direction = "horizontal",
  action = "workspace",
})

hl.gesture({
  fingers = 3,
  direction = "up",
  action = function()
    hl.exec_cmd(var.scripts.launcher)
  end,
})

hl.gesture({
  fingers = 3,
  direction = "down",
  action = function()
    hl.exec_cmd(var.scripts.powermenu)
  end,
})

hl.gesture({
  fingers = 4,
  direction = "vertical",
  action = "special",
  workspace_name = "window",
})

hl.workspace_rule({
  workspace = "special:window",
  gaps_in = 3,
  gaps_out = { top = 120, right = 240, bottom = 120, left = 240 },
})
