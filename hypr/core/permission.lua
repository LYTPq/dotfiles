hl.config({
  ecosystem = {
    enforce_permissions = false,
  },
})

hl.permission("/bin/grim", "screencopy", "allow")

-- dont actually work but for some reasons reduces the number of notifications
hl.permission("/home/rahman/Arch-dotfiles/scripts/screenshot.sh", "screencopy", "allow")
hl.permission("/home/rahman/Arch-dotfiles/scripts/screenshot-full.sh", "screencopy", "allow")

hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "ask")
