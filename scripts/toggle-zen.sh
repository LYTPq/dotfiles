#!/bin/bash
set -euo pipefail

STATE="$HOME/.cache/hypr-zen-mode"
MONITOR=""

# Configuration
NORMAL_GAPS_OUTER=10
NORMAL_GAPS_INNER=5
NORMAL_BORDER_SIZE=2
NORMAL_ROUNDING=1
NORMAL_ROUNDING_POWER=5
NORMAL_WALLPAPER="$DOTFILES/wallpaper/wallpaper3.png"

ZEN_GAPS_OUTER=0
ZEN_GAPS_INNER=0
ZEN_BORDER_SIZE=0
ZEN_ROUNDING=0
ZEN_ROUNDING_POWER=0
ZEN_WALLPAPER="$DOTFILES/wallpaper/wallpaper3.png"

# Functions
set_hyprland() {
  hyprctl --batch "keyword general:gaps_out $1; \
                   keyword general:gaps_in $2; \
                   keyword general:border_size $3; \
                   keyword decoration:rounding $4; \
                   keyword decoration:rounding_power $5"
}

set_wallpaper() {
  local WALLPAPER="$1"
  hyprctl hyprpaper wallpaper "$MONITOR, $WALLPAPER, cover"
}

if [[ -f "$STATE" ]]; then
  # ZEN mode is active, switch to NORMAL
  set_hyprland "$NORMAL_GAPS_OUTER" "$NORMAL_GAPS_INNER" "$NORMAL_BORDER_SIZE" "$NORMAL_ROUNDING" "$NORMAL_ROUNDING_POWER"
  set_wallpaper "$NORMAL_WALLPAPER"
  waybar & disown
  rm -f "$STATE"
else
  # ZEN mode is not active, switch to ZEN
  set_hyprland "$ZEN_GAPS_OUTER" "$ZEN_GAPS_INNER" "$ZEN_BORDER_SIZE" "$ZEN_ROUNDING" "$ZEN_ROUNDING_POWER"
  set_wallpaper "$ZEN_WALLPAPER"
  pkill waybar || true
  touch "$STATE"
fi
