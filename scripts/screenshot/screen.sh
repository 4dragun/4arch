#!/usr/bin/env bash

SPIC="$HOME/Pictures/Screenshots/$(date +'%d.%m.%y_%H:%M:%S_screen.png')"

mkdir -p ~/Pictures/Screenshots

grimblast save screen "$SPIC"

notify-send -i "$SPIC" "Screenshot Saved" "$SPIC"
