#!/usr/bin/env bash
spic="$HOME/Pictures/Screenshots/$(date +'%d-%m-%Y_%H:%M:%S_grimscreen.png')"

grimblast save screen "$spic" && notify-send -i "$spic" "Screenshot Saved" "$spic"
