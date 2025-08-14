#!/usr/bin/env bash

FILTER="*.png *.jpg *.jpeg|Image Files"

ICON="$HOME/4arch/azzets/matunoti.png"

SEL_WALL=$(kdialog --getopenfilename "$HOME/Pictures" "$FILTER")

if [ -z "$SEL_WALL" ]; then
  notify-send -i "$ICON" "Matugen" "No image selected!"

  echo -e "\n Script: No image selected. Exiting.\n"
  exit
fi

echo "$SEL_WALL" > "$HOME/.cache/last_wall.txt"

echo -e "\n Script: applying theme using $SEL_WALL\n"

matugen image "$SEL_WALL" || {
  notify-send -i "$ICON" "Matugen" "manual intervention needed!"
  exit
}

notify-send "Matugen" "$SEL_WALL" -i "$SEL_WALL"
