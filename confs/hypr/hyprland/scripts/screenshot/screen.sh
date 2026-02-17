#!/usr/bin/env bash

SHOT="$HOME/Pictures/Screenshots/$(date +'%d.%m.%y_%H:%M:%S_screen.png')"

mkdir -p ~/Pictures/Screenshots
grimblast save screen "$SHOT"
notify-send -i "$SHOT" "Screenshot" "$SHOT"
