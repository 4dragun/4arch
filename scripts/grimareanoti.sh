#!/usr/bin/env bash
spic="$HOME/Pictures/Screenshots/$(date +'%d-%m-%Y_%H:%M:%S_grimarea.png')"

grimblast save area "$spic" && notify-send -i "$spic" "Screenshot Saved" "$spic"
