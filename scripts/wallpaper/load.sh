#!/usr/bin/env bash

WALL=$(cat "$HOME/.cache/last_wall.txt")

systemctl --user start hyprpaper

sleep 0.5

if [[ -z "$WALL" || ! -f "$WALL" ]]; then
  echo
  echo "NO SAVED WALLPAPER FOUND OR FILE MISSING!"
  echo
  exit
fi

hyprctl hyprpaper reload ,"$WALL"
