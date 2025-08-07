#!/usr/bin/env bash

FILTER="*.png *.jpg *.jpeg|Image Files"

MATUNOTI="$HOME/4arch/azzets/matunoti.png"

sel_wall=$(kdialog --getopenfilename "$HOME/Pictures" "$FILTER")

if [ -z "$sel_wall" ]; then
  notify-send -i "$MATUNOTI" "Matugen" "No image selected!"
  echo
  echo " Script: No image selected. Exiting."
  exit 1
fi

echo "$sel_wall" > "$HOME/.cache/last-wall.txt"

echo
echo " Script: applying theme using $sel_wall"
echo
matugen image "$sel_wall" || {
  notify-send -i "$MATUNOTI" "Matugen" "Manual intervention needed!"
  exit 1
}

notify-send "Matugen" "$sel_wall" -i "$sel_wall"
