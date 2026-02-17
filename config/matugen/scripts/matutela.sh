#!/usr/bin/env bash

COLOR=$(cat ~/.cache/matutela.archy)
INSTALL_SCRIPT="$HOME/.config/ZTELA/install.sh"
THEME_NAME="Tela-circle-${COLOR}-dark"
SRC_PATH="$HOME/.local/share/icons/$THEME_NAME"
DST_PATH="$HOME/.local/share/icons/matutela"
INDEX_FILE="$DST_PATH/index.theme"
ICON_DIR="$HOME/.local/share/icons"

NOTI_ICON="$HOME/.local/share/icons/matutela/scalable/apps/adjust-colors.svg"

notify-send -i "$NOTI_ICON" "Matugen" "please wait..."

# Step 1: Delete all existing 'Tela*' folders
find "$ICON_DIR" -maxdepth 1 -type d -name "Tela*" -exec rm -rf {} +

# Step 2: Run install.sh with color
"$INSTALL_SCRIPT" "$COLOR" || { exit; }

# Step 3: Copy new theme to matutela
if [[ -d "$SRC_PATH" ]]; then
    rm -rf "$DST_PATH"
    cp -rf "$SRC_PATH" "$DST_PATH"

    # Step 4: Rename the theme inside index.theme
    if [[ -f "$INDEX_FILE" ]]; then
        sed -i 's/^Name=.*/Name=matutela/' "$INDEX_FILE"
        echo "[matutela] Updated index.theme Name to 'matutela'"
    else
        echo "[matutela] Warning: index.theme file not found!"
    fi

    echo "[matutela] Updated icon theme with color: #$COLOR"
else
    echo "[matutela] Error: source theme '$SRC_PATH' not found."
fi
