hl.on("hyprland.start", function()
  hl.exec_cmd("systemctl --user start hyprland.target")
  hl.exec_cmd("dbus-update-activation-environment --systemd --all")
  hl.exec_cmd("hyprpaper")
  hl.exec_cmd("swaync")
  hl.exec_cmd("hyprsunset")
  hl.exec_cmd("nm-applet --indicator")
  hl.exec_cmd("hyprctl setcursor Hackneyed 28")
  hl.exec_cmd("systemctl --user start hyprpolkitagent")
end)

-- there is backup in claude code history
