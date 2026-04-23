
# EITHER I AM RETARDED AS FUCK OR CLAUDE BY UNKNOWN REASONS BECOME THE MOST STUPID PIECE OF FUCKING TWAT I HAVE EVER
# SEEN SO IT IS BETTER TO INSPECT THIS BEFORE LAUNCH ON A NEW MACHINE
# APPARANTLY STUFF WITH SYSTEMD IS NOT WORKING
# AND I NEED TO DO SOMETHING WITH THE ./CONFIG/SYSTEMD FILES(BY SOMETHING I MEAN MANAGE THEM, OR NOT, I STILL)

#!/bin/bash
set -euo pipefail

DOTFILES="${DOTFILES:-"$HOME/Arch-dotfiles"}"
CONFIG_DIR="$HOME/.config"

CONFIG_LINKS=(
  btop
  hypr
  kitty
  lazygit
  nvim
  rofi
  swaync
  waybar
  yazi
  fastfetch
  pacseek
  gdu
  lazydocker
  opencode
  pgcli
)


link_item() {
  local src="$1"
  local dest="$2"
  if [[ -e "$src" ]]; then
    echo "Linking $src to $dest"
    ln -sfT "$src" "$dest"
  else
    echo "Skipping missing item: $src" >&2
  fi
}

for item in "${CONFIG_LINKS[@]}"; do
  link_item "$DOTFILES/$item" "$CONFIG_DIR/$item"
done

link_item "$DOTFILES/.editorconfig" "$HOME/.editorconfig"
link_item "$DOTFILES/tmux/.tmux.conf" "$HOME/.tmux.conf"
link_item "$DOTFILES/zsh/.zshrc" "$HOME/.zshrc"
link_item "$DOTFILES/zsh/.p10k.zsh" "$HOME/.p10k.zsh"
link_item "$DOTFILES/zsh/.zprofile" "$HOME/.zprofile"
link_item "$DOTFILES/zsh/.zsh_plugins.txt" "$HOME/.zsh_plugins.txt"
link_item "$DOTFILES/git/.gitconfig" "$HOME/.gitconfig"


# ---- systemd user units (file-by-file, not whole-dir) ----
mkdir -p "$HOME/.config/systemd/user"

SYSTEMD_UNITS=(
  hyprland.target
  battery-monitor.service
  ydotoold.service
)

for unit in "${SYSTEMD_UNITS[@]}"; do
  link_item "$DOTFILES/systemd/user/$unit" "$HOME/.config/systemd/user/$unit"
done

SYSTEMD_DROPINS=(
  hypridle.service.d
  hyprpolkitagent.service.d
)

for dropin in "${SYSTEMD_DROPINS[@]}"; do
  link_item "$DOTFILES/systemd/user/$dropin" "$HOME/.config/systemd/user/$dropin"
done
