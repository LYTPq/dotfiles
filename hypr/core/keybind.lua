local var = require("util.variable")

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
hl.bind(var.mod .. " + SHIFT + Z", hl.dsp.exec_cmd(var.scripts.zen))
hl.bind("Print", hl.dsp.exec_cmd(var.scripts.screenshot))
hl.bind(var.mod .. " + Print", hl.dsp.exec_cmd(var.scripts.screenshotfull))

-- Window management
hl.bind(var.mod .. " + F", hl.dsp.window.fullscreen())
hl.bind(var.mod .. " + SHIFT + F", hl.dsp.exec_cmd("hyprctl dispatch fullscreenstate 0 2"))
hl.bind(var.mod .. " + SHIFT + K", hl.dsp.window.force_kill())
hl.bind(var.mod .. " + SHIFT + Q", hl.dsp.window.close())
hl.bind(var.mod .. " + SHIFT + SPACE", hl.dsp.window.float({ action = "toggle" }))

-- Alt-tab master layout rolling
hl.bind("ALT + TAB", function()
  hl.dispatch(hl.dsp.layout_msg("rollnext"))
  hl.dispatch(hl.dsp.layout_msg("focusmaster master"))
end)
hl.bind("ALT + SHIFT + TAB", function()
  hl.dispatch(hl.dsp.layout_msg("rollprev"))
  hl.dispatch(hl.dsp.layout_msg("focusmaster master"))
end)

-- Prevent accidental dragging
hl.config({
  binds = {
    drag_threshold = 5,
  },
})

-- Move and resize windows with mouse
hl.bindm(var.mod .. " + mouse:272", hl.dsp.window.move())
hl.bindm(var.mod .. " + G", hl.dsp.window.resize())

-- Zoom out/in
hl.bind(var.mod .. " + SHIFT + mouse_up", hl.dsp.exec_cmd(var.scripts.zoom .. " out"))
hl.bind(var.mod .. " + SHIFT + mouse_down", hl.dsp.exec_cmd(var.scripts.zoom .. " in"))

-- Change focus on floating windows
hl.bind("CTRL + ALT + TAB", function()
  hl.dispatch(hl.dsp.window.cycle_next({ next = true }))
  hl.dispatch(hl.dsp.window.alter_zorder({ mode = "top" }))
end)
hl.bind("CTRL + ALT + SHIFT + TAB", function()
  hl.dispatch(hl.dsp.window.cycle_next({ next = false }))
  hl.dispatch(hl.dsp.window.alter_zorder({ mode = "top" }))
end)

-- Previous workspace
hl.bind(var.mod .. " + TAB", hl.dsp.workspace.switch({ name = "previous" }))

-- Move focus with arrow keys
hl.bind(var.mod .. " + left", hl.dsp.window.focus("l"))
hl.bind(var.mod .. " + right", hl.dsp.window.focus("r"))
hl.bind(var.mod .. " + up", hl.dsp.window.focus("u"))
hl.bind(var.mod .. " + down", hl.dsp.window.focus("d"))

-- Move window
hl.bind(var.mod .. " + SHIFT + left", hl.dsp.window.move_to("l"))
hl.bind(var.mod .. " + SHIFT + right", hl.dsp.window.move_to("r"))
hl.bind(var.mod .. " + SHIFT + up", hl.dsp.window.move_to("u"))
hl.bind(var.mod .. " + SHIFT + down", hl.dsp.window.move_to("d"))

-- Move windows (floating) - binde = repeat on hold
hl.binde(var.mod .. " + CTRL + left", hl.dsp.window.move_active({ x = -40, y = 0 }))
hl.binde(var.mod .. " + CTRL + right", hl.dsp.window.move_active({ x = 40, y = 0 }))
hl.binde(var.mod .. " + CTRL + up", hl.dsp.window.move_active({ x = 0, y = -40 }))
hl.binde(var.mod .. " + CTRL + down", hl.dsp.window.move_active({ x = 0, y = 40 }))

-- Special workspace (scratchpad)
hl.workspace({
  name = "special:window",
  gapsin = 3,
  gapsout = "120 240 120 240",
})
hl.bind(var.mod .. " + X", hl.dsp.workspace.toggle_special("window"))
hl.bind(var.mod .. " + grave", hl.dsp.window.move_to_workspace({ name = "special:window" }))
hl.bind(var.mod .. " + I", hl.dsp.window.move_to_workspace({ relative = 0 }))

-- Second special workspace
hl.workspace({
  name = "special:windows",
  gapsin = 3,
  gapsout = "120 240 120 240",
})
hl.bind(var.mod .. " + backslash", hl.dsp.workspace.toggle_special("windows"))
hl.bind(var.mod .. " + SHIFT + backslash", hl.dsp.window.move_to_workspace({ name = "special:windows" }))
hl.bind(var.mod .. " + CTRL + backslash", hl.dsp.window.move_to_workspace({ relative = 0 }))

-- Minimize (kinda)
hl.workspace({
  name = "special:minimize",
  gapsin = 0,
  gapsout = 0,
  border = false,
})
hl.bind(var.mod .. " + SHIFT + W", hl.dsp.window.move_to_workspace_silent({ name = "special:minimize" }))
hl.bind(var.mod .. " + W", hl.dsp.workspace.toggle_special("minimize"))
hl.bind(var.mod .. " + CTRL + W", hl.dsp.window.move_to_workspace({ relative = 0 }))

-- Scroll through existing workspaces
hl.bind(var.mod .. " + mouse_up", hl.dsp.workspace.switch({ relative = 1 }))
hl.bind(var.mod .. " + mouse_down", hl.dsp.workspace.switch({ relative = -1 }))
hl.bind("Page_Up", hl.dsp.workspace.switch({ relative = -1 }))
hl.bind("End", hl.dsp.workspace.switch({ relative = 1 }))

-- Switch workspaces with mod + [0-9]
for i = 1, 9 do
  hl.bind(var.mod .. " + " .. i, hl.dsp.workspace.switch({ id = i }))
  hl.bind(var.mod .. " + SHIFT + " .. i, hl.dsp.window.move_to_workspace({ id = i }))
end
hl.bind(var.mod .. " + 0", hl.dsp.workspace.switch({ id = 10 }))
hl.bind(var.mod .. " + SHIFT + 0", hl.dsp.window.move_to_workspace({ id = 10 }))

-- Laptop multimedia keys
hl.bindel("XF86AudioRaiseVolume", hl.dsp.exec_cmd(var.scripts.mediactl .. " volume-up"))
hl.bindel("XF86AudioLowerVolume", hl.dsp.exec_cmd(var.scripts.mediactl .. " volume-down"))
hl.bindel("XF86AudioMute", hl.dsp.exec_cmd(var.scripts.mediactl .. " mute"))
hl.bindel("XF86AudioMicMute", hl.dsp.exec_cmd(var.scripts.mediactl .. " mic-mute"))
hl.bindel("XF86MonBrightnessUp", hl.dsp.exec_cmd(var.scripts.mediactl .. " brightness-up"))
hl.bindel("XF86MonBrightnessDown", hl.dsp.exec_cmd(var.scripts.mediactl .. " brightness-down"))
