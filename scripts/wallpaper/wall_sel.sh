#!/usr/bin/env bash

filter="*.png *.jpg *.jpeg|Image Files"

icon="$HOME/4arch/azzets/matunoti.png"

sel_wall=$(kdialog --getopenfilename "$HOME/Pictures" "$filter")

if [ -z "$sel_wall" ]; then
  notify-send -i "$icon" "Matugen" "No image selected!"
  echo
  echo " Script: No image selected. Exiting."
  exit 1
fi

echo "$sel_wall" > "$HOME/.cache/last-wall.txt"

echo
echo " Script: applying theme using $sel_wall"
echo
matugen image "$sel_wall" || {
  notify-send -i "$icon" "Matugen" "Manual intervention needed!"
  exit 1
}

notify-send "Matugen" "$sel_wall" -i "$sel_wall"
