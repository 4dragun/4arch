#!/usr/bin/env bash

FILTER="*.png *.jpg *.jpeg|Image Files"

ICON="$HOME/4arch/assets/matunoti.png"

SEL_WALL=$(kdialog --getopenfilename "$HOME/Pictures" "$FILTER")

if [ -z "$SEL_WALL" ]; then
  notify-send -i "$ICON" "Matugen" "no image selected!"
  echo
  echo "SCRIPT: NO IMAGE SELECTED! EXITING."
  exit
fi

echo "$SEL_WALL" > "$HOME/.cache/last_wall.txt"
echo
echo "SCRIPT: APPLYING THEME USING $SEL_WALL"
echo

matugen image "$SEL_WALL" || {
  notify-send -i "$ICON" "Matugen" "manual intervention needed!"
  exit
}

notify-send "Matugen" "$SEL_WALL" -i "$SEL_WALL"
