#!/usr/bin/env bash

ICON="$HOME/.local/share/icons/matutela/scalable/apps/deepin-image-viewer.svg"
SHOT="$HOME/Pictures/Screenshots/$(date +'%d.%m.%y_%H:%M:%S_screen.png')"

mkdir -p ~/Pictures/Screenshots
grimblast save screen "$SHOT"
notify-send -i "$ICON" "Screenshot" "$SHOT"
