#!/usr/bin/env bash

FLAG="$HOME/.cache/first_run.archy"
ICON="$HOME/.local/share/icons/matutela/scalable/apps/kalu.svg"

if [ ! -f "$FLAG" ]; then
  sleep 0.5
  notify-send -i "$ICON" "4ARCH" "Welcome to Archy Hyprland ✨"
  $HOME/.config/hypr/hyprland/scripts/wallpaper/pick.sh || exit
  touch "$FLAG"
fi
