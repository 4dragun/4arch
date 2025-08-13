#!/usr/bin/env bash

WALL=$(cat "$HOME/.cache/last-wall.txt")

systemctl --user start hyprpaper

sleep 0.5

if [[ -z "$WALL" || ! -f "$WALL" ]]; then
  echo -e "\n No saved wallpaper found or file missing.\n"
  exit
fi

hyprctl hyprpaper reload ,"$WALL"
