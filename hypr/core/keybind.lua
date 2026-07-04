local var = require("util.variable")
local zen = require("util.zen")

-- Application launching
hl.bind(var.mod .. " + RETURN", hl.dsp.exec_cmd(var.apps.terminal))
hl.bind(var.mod .. " + T", hl.dsp.exec_cmd(var.apps.terminal))
hl.bind(var.mod .. " + E", hl.dsp.exec_cmd(var.apps.filemanager))
hl.bind(var.mod .. " + D", hl.dsp.exec_cmd(var.scripts.launcher))
hl.bind(var.mod .. " + L", hl.dsp.exec_cmd(var.apps.lockscreen))
hl.bind(var.mod .. " + N", hl.dsp.exec_cmd(var.apps.notifpanel))
hl.bind(var.mod .. " + slash", hl.dsp.exec_cmd(var.scripts.websearch))
hl.bind(var.mod .. " + SHIFT + A", hl.dsp.exec_cmd(var.apps.browser))
hl.bind(var.mod .. " + SHIFT + D", hl.dsp.exec_cmd(var.apps.ide))
hl.bind(var.mod .. " + SHIFT + E", hl.dsp.exec_cmd(var.scripts.powermenu))
hl.bind(var.mod .. "+ SHIFT + Z", function()
  zen.toggle()
end)
hl.bind("Print", hl.dsp.exec_cmd(var.scripts.screenshot))
hl.bind(var.mod .. " + Print", hl.dsp.exec_cmd(var.scripts.screenshotfull))

-- Window management
hl.bind(var.mod .. " + F", hl.dsp.window.fullscreen({ action = "toggle" }))
hl.bind(var.mod .. " + SHIFT + F", hl.dsp.window.fullscreen_state({ internal = 0, client = 2, action = "toggle" }))
hl.bind(var.mod .. " + SHIFT + K", hl.dsp.window.kill())
hl.bind(var.mod .. " + SHIFT + Q", hl.dsp.window.close())
hl.bind(var.mod .. " + SHIFT + SPACE", hl.dsp.window.float({ action = "toggle" }))

-- Alt-tab
hl.bind("ALT + TAB", function()
  hl.dispatch(hl.dsp.window.cycle_next({ next = true, floating = true }))
  hl.dispatch(hl.dsp.window.alter_zorder({ mode = "top" }))
end)

-- Change focus between floating windows
hl.bind("CTRL + ALT + TAB", function()
  hl.dispatch(hl.dsp.window.cycle_next({ next = true }))
  hl.dispatch(hl.dsp.window.alter_zorder({ mode = "top" }))
end)
hl.bind("CTRL + ALT + SHIFT + TAB", function()
  hl.dispatch(hl.dsp.window.cycle_next({ next = false }))
  hl.dispatch(hl.dsp.window.alter_zorder({ mode = "top" }))
end)

-- Prevent accidental dragging
hl.config({
  binds = {
    drag_threshold = 5,
  },
})

-- Mouse window movement and resizing
hl.bind(var.mod .. " + mouse:272", hl.dsp.window.drag())
hl.bind(var.mod .. " + G", hl.dsp.window.resize())

-- Zoom
hl.bind(var.mod .. " + SHIFT + mouse_up", hl.dsp.exec_cmd(var.scripts.zoom .. " out"))
hl.bind(var.mod .. " + SHIFT + mouse_down", hl.dsp.exec_cmd(var.scripts.zoom .. " in"))

-- Previous workspace
hl.bind(var.mod .. " + TAB", hl.dsp.focus({ workspace = "previous" }))

-- Move focus with arrow keys
hl.bind(var.mod .. " + left", hl.dsp.focus({ direction = "l" }))
hl.bind(var.mod .. " + right", hl.dsp.focus({ direction = "r" }))
hl.bind(var.mod .. " + up", hl.dsp.focus({ direction = "u" }))
hl.bind(var.mod .. " + down", hl.dsp.focus({ direction = "d" }))

-- Move windows with arrow keys
hl.bind(var.mod .. " + SHIFT + left", hl.dsp.window.move({ direction = "l" }))
hl.bind(var.mod .. " + SHIFT + right", hl.dsp.window.move({ direction = "r" }))
hl.bind(var.mod .. " + SHIFT + up", hl.dsp.window.move({ direction = "u" }))
hl.bind(var.mod .. " + SHIFT + down", hl.dsp.window.move({ direction = "d" }))

-- Move floating windows (repeat on hold)
hl.bind(var.mod .. " + CTRL + left", hl.dsp.window.move({ direction = "l" }), { repeating = true })
hl.bind(var.mod .. " + CTRL + right", hl.dsp.window.move({ direction = "r" }), { repeating = true })
hl.bind(var.mod .. " + CTRL + up", hl.dsp.window.move({ direction = "u" }), { repeating = true })
hl.bind(var.mod .. " + CTRL + down", hl.dsp.window.move({ direction = "d" }), { repeating = true })

-- Scroll through workspaces
hl.bind(var.mod .. " + mouse_up", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(var.mod .. " + mouse_down", hl.dsp.focus({ workspace = "e-1" }))
hl.bind("Page_Up", hl.dsp.focus({ workspace = "e-1" }))
hl.bind("End", hl.dsp.focus({ workspace = "e+1" }))

-- Switch workspaces with mod + [0-9]
for i = 1, 10 do
  local key = i % 10
  hl.bind(var.mod .. " + " .. key, hl.dsp.focus({ workspace = i }))
  hl.bind(var.mod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Special workspace (scratchpad)
hl.workspace_rule({
  workspace = "special:window",
  gaps_in = 3,
  gaps_out = { top = 120, right = 240, bottom = 120, left = 240 },
})
hl.bind(var.mod .. " + X", hl.dsp.workspace.toggle_special("window"))
hl.bind(var.mod .. " + grave", hl.dsp.window.move({ workspace = "special:window" }))
hl.bind(var.mod .. " + I", hl.dsp.window.move({ workspace = "e+0" }))

-- Second special workspace
hl.workspace_rule({
  workspace = "special:windows",
  gaps_in = 3,
  gaps_out = { top = 120, right = 240, bottom = 120, left = 240 },
})
hl.bind(var.mod .. " + backslash", hl.dsp.workspace.toggle_special("windows"))
hl.bind(var.mod .. " + SHIFT + backslash", hl.dsp.window.move({ workspace = "special:windows" }))
hl.bind(var.mod .. " + CTRL + backslash", hl.dsp.window.move({ workspace = "e+0" }))

-- Minimize (kinda)
hl.workspace_rule({
  workspace = "special:minimize",
  gaps_in = 0,
  gaps_out = { top = 0, right = 0, bottom = 0, left = 0 },
  border_size = 0,
})
hl.bind(var.mod .. " + SHIFT + W", hl.dsp.window.move({ workspace = "special:minimize" }))
hl.bind(var.mod .. " + W", hl.dsp.workspace.toggle_special("minimize"))
hl.bind(var.mod .. " + CTRL + W", hl.dsp.window.move({ workspace = "e+0" }))

-- Laptop multimedia keys
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(var.scripts.mediactl .. " volume-up"), { repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(var.scripts.mediactl .. " volume-down"), { repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd(var.scripts.mediactl .. " mute"))
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd(var.scripts.mediactl .. " mic-mute"))
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd(var.scripts.mediactl .. " brightness-up"), { repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(var.scripts.mediactl .. " brightness-down"), { repeating = true })
