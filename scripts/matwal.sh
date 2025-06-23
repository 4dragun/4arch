#!/bin/bash

WALL_DIR="$HOME/Wallpaper-Bank/wallpapers"

# Check dependencies
if ! command -v fzf &> /dev/null; then
    echo "fzf is not installed. Please install it with: sudo pacman -S fzf (or your distro's package manager)"
    exit 1
fi

if ! command -v matugen &> /dev/null; then
    echo "matugen is not installed. Install it first."
    exit 1
fi

# Select image with fzf
wallpaper=$(find "$WALL_DIR" -type f \( -iname "*.png" -o -iname "*.jpg" -o -iname "*.jpeg" \) | fzf --prompt="Select a wallpaper: ")

# Check selection
if [ -z "$wallpaper" ]; then
    echo "No image selected. Exiting."
    exit 1
fi

# Apply with matugen
echo "Applying theme using: $wallpaper"
matugen image "$wallpaper"

# Send notification
notify-send "Wallpaper changed" "$wallpaper" -i "$wallpaper"

