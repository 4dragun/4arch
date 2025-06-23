#!/bin/bash
wal_dir="$HOME/Wallpaper-Bank/wallpapers"
wal=$(find "$wal_dir" -type f | fzf --prompt="Select a wallpaper: ")

# Check selection
if [ -z "$wal" ]; then
    echo "No image selected. Exiting."
    exit 1
fi

echo "Applying theme using: $wal"
matugen image "$wal"

notify-send "Wallpaper changed" "$wal" -i "$wal"

