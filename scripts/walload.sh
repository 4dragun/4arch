#!/usr/bin/env bash

systemctl --user start hyprpaper

sleep 0.5

wall=$(cat "$HOME/.cache/last-wall.txt" 2>/dev/null)

if [[ -z "$wall" || ! -f "$wall" ]]; then
    echo "No saved wallpaper found or file missing."
    exit 1
fi

uwsm app -- hyprctl hyprpaper reload ",$wall"
