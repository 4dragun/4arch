#!/usr/bin/env bash

FILT="*.png *.jpg *.jpeg|Image Files"
ICON="$HOME/4arch/assets/matunoti.png"

PICK=$(QT_QPA_PLATFORMTHEME=kde kdialog --getopenfilename "$HOME/Pictures" "$FILT")
WALL=$(basename "$PICK")

if [ -z "$PICK" ]; then
  notify-send -i "$ICON" "Matugen" "no image selected!"
  echo -e "\n~ NO IMAGE SELECTED! EXITING.\n"; exit
fi

echo "$PICK" > "$HOME/.cache/last_wall.txt"
echo -e "\n* APPLYING THEME USING $PICK\n"

matugen -t scheme-content image "$PICK" || {
  notify-send -i "$ICON" "Matugen" "manual intervention needed!"
  exit
}

notify-send -i "$PICK" "Matugen" "$WALL"
