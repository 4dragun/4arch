#!/usr/bin/env bash

spic="$HOME/Pictures/Screenshots/$(date +'%d.%m.%Y_%H:%M:%S-grimarea.png')"

mkdir -p ~/Pictures/Screenshots

grimblast save area "$spic"
notify-send -i "$spic" "Screenshot Saved" "$spic"
