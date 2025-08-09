#!/usr/bin/env bash

FLAG="$HOME/.config/firstrun.archy"
ICON="$HOME/4arch/azzets/4.png"

if [ ! -f "$FLAG" ]; then
  sleep 1

  notify-send -i "$ICON" "4ARCH" "Welcome to Archy Hyprland ✨"
  
  ~/4arch/scripts/wallstuff.sh || { exit; }
  
  touch "$FLAG"
fi
