#!/usr/bin/env bash

SPIC="$HOME/Pictures/Screenshots/$(date +'%d.%m.%y_%H:%M:%S_area.png')"

mkdir -p ~/Pictures/Screenshots

grimblast save area "$SPIC"

notify-send -i "$SPIC" "Screenshot Saved" "$SPIC"
