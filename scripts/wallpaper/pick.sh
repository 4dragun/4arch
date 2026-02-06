#!/usr/bin/env bash

FILT="*.png *.jpg *.jpeg|Image Files"
ICON="$HOME/4arch/assets/matunoti.png"

WALL=$(QT_QPA_PLATFORMTHEME=kde kdialog --getopenfilename "$HOME/Pictures" "$FILT")

if [ -z "$WALL" ]; then
  notify-send -i "$ICON" "Matugen" "no image selected!"
  echo -e "\n~ NO IMAGE SELECTED! EXITING.\n"; exit
fi

echo "$WALL" > "$HOME/.cache/last_wall.txt"
echo -e "\n* APPLYING THEME USING $WALL\n"

matugen -t scheme-content image "$WALL" || {
  notify-send -i "$ICON" "Matugen" "manual intervention needed!"
  exit
}

notify-send "Matugen" "$WALL" -i "$WALL"
