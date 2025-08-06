#!/usr/bin/env bash

spic="$HOME/Pictures/Screenshots/$(date +'%d.%m.%Y_%H:%M:%S-grimscreen.png')"

mkdir -p ~/Pictures/Screenshots

grimblast save screen "$spic"
notify-send -i "$spic" "Screenshot Saved" "$spic"
