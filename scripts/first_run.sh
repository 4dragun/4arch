#!/usr/bin/env bash

flag="$HOME/.config/first_run.archy"
icon="$HOME/4arch/azzets/4.png"

if [ ! -f "$flag" ]; then
  sleep 1

  notify-send -i "$icon" "4ARCH" "Welcome to Archy Hyprland ✨"
  
  ~/4arch/scripts/wallpaper/wall_sel.sh || { exit; }
  
  touch "$flag"
fi
