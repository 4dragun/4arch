#!/usr/bin/env bash

FLAG="$HOME/.config/first_run.archy"
ICON="$HOME/4arch/assets/4.png"

if [ ! -f "$FLAG" ]; then
  sleep 0.5
  notify-send -i "$ICON" "4ARCH" "Welcome to Archy Hyprland ✨"
  $HOME/4arch/scripts/wallpaper/pick.sh || exit
  touch "$FLAG"
fi
