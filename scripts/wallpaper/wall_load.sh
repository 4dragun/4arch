#!/usr/bin/env bash

wall=$(cat "$HOME/.cache/last-wall.txt")

systemctl --user start hyprpaper

sleep 0.5

if [[ -z "$wall" || ! -f "$wall" ]]; then
  echo -e "\n No saved wallpaper found or file missing.\n"
  exit
fi

hyprctl hyprpaper reload ,"$wall"
