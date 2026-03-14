#!/usr/bin/env bash

FILT="*.png *.jpg *.jpeg|Image Files"
ICON="$HOME/.local/share/icons/matutela/scalable/apps/adjust-colors.svg"

WALL=$(kdialog --getopenfilename "$HOME/Pictures" "$FILT")

if [ -z "$WALL" ]; then
  notify-send -i "$ICON" "Matugen" "no image selected!"
  echo -e "\n~ NO IMAGE SELECTED! EXITING.\n"; exit
fi

echo "$WALL" > "$HOME/.cache/last_wall.txt"
echo -e "\n* APPLYING THEME USING $WALL\n"

matugen -t scheme-content --source-color-index 0 image "$WALL" || {
  notify-send -i "$ICON" "Matugen" "manual intervention needed!"
  exit
}

notify-send -i "$ICON" "Matugen" "$WALL"
