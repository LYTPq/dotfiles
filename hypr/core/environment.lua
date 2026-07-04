-- Environment variables
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")
hl.env("GDK_SCALE", "2")
hl.env("XCURSOR_SIZE", "18")
hl.env("HYPRCURSOR_SIZE", "24") -- see in startup
hl.env("QT_STYLE_OVERRIDE", "kvantum")

hl.env("MOZ_ENABLE_WAYLAND", "1")
hl.env("AQ_DRM_DEVICES", "/dev/dri/amd-igpu:/dev/dri/nvidia-gpu")
hl.env("DOTFILES", os.getenv("HOME") .. "/Arch-dotfiles")
