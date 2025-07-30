#!/usr/bin/env bash

# Find image files, excluding hidden directories
mapfile -t files < <(find "$HOME" -type d -name ".*" -prune -o -type f \( -iname "*.png" -o -iname "*.jpg" -o -iname "*.jpeg" \) -print)

# Build rofi input with icon paths
rofi_input=""
for f in "${files[@]}"; do
    filename=$(basename "$f")
    # Format: text\0icon\x1ficon_path
    rofi_input+="${filename}\0icon\x1f${f}\n"
done

# Use printf to preserve null bytes and newlines correctly
wal=$(printf "%b" "$rofi_input" | rofi -dmenu -show-icons -theme ~/.config/MATUGEN_OUTPUTS/maturofiwal.rasi -i -p "")

if [ -z "$wal" ]; then
    echo "No image selected. Exiting."
    exit 1
fi

# Find full path of selected wallpaper by matching basename
selected_path=""
for f in "${files[@]}"; do
    if [ "$(basename "$f")" = "$wal" ]; then
        selected_path="$f"
        break
    fi
done

if [ -z "$selected_path" ]; then
    echo "Selected wallpaper not found. Exiting."
    exit 1
fi

echo "$selected_path" > "$HOME/.cache/last-wall.txt"

echo "Applying theme using: $selected_path"
matugen image "$selected_path" || { notify-send -i "$HOME/4arch/azzets/matunoti.png" "Matugen" "manual intervention needed ..!" && exit; }

notify-send "Matugen wallpaper" "$selected_path" -i "$selected_path"
