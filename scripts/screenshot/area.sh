#!/usr/bin/env bash

SHOT="$HOME/Pictures/Screenshots/$(date +'%d.%m.%y_%H:%M:%S_area.png')"

mkdir -pv ~/Pictures/Screenshots

grimblast save area "$SHOT"

notify-send -i "$SHOT" "Screenshot" "$SHOT"
