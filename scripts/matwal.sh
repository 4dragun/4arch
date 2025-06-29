#!/usr/bin/env bash

wal=$(find "$HOME" \
  -type d -name ".*" -prune -o \
  -type f \( -iname "*.png" -o -iname "*.jpg" -o -iname "*.jpeg" \) -print \
  | fzf --prompt="Select a wallpaper: ")

# Check selection
if [ -z "$wal" ]; then
    echo "No image selected. Exiting."
    exit 1
fi

echo "$wal" > "$HOME/.cache/last-wall.txt"

echo "Applying theme using: $wal"
matugen --type scheme-content image "$wal"

notify-send "Wallpaper changed" "$wal" -i "$wal"

