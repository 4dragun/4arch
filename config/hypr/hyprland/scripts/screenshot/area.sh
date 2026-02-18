#!/usr/bin/env bash

ICON="$HOME/.local/share/icons/matutela/scalable/apps/deepin-image-viewer.svg"
SHOT="$HOME/Pictures/Screenshots/$(date +'%d.%m.%y_%H:%M:%S_area.png')"

mkdir -p ~/Pictures/Screenshots
grimblast save area "$SHOT"
notify-send -i "$ICON" "Screenshot" "$SHOT"
