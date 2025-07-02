#!/usr/bin/env bash

CONF_PATH="/etc/mkinitcpio.conf"
BACKUP_PATH="$CONF_PATH.bak"
TMP_PATH="/tmp/mkinitcpio.conf.tmp"

# Backup original
sudo cp "$CONF_PATH" "$BACKUP_PATH"

# Run sed on temp file
sudo sed -E '/^HOOKS=\(.*filesystems.*fsck.*\)/ {
    /resume/! s/(filesystems)([[:space:]]+)(fsck)/\1\2resume\2\3/
}' "$CONF_PATH" | sudo tee "$TMP_PATH" > /dev/null

# Compare and replace if changed
if ! sudo diff -q "$CONF_PATH" "$TMP_PATH" > /dev/null; then
    echo "File changed, updating and running mkinitcpio -P..."
    sudo cp "$TMP_PATH" "$CONF_PATH"
    sudo mkinitcpio -P
else
    echo "No changes detected, skipping mkinitcpio -P."
fi

# Cleanup
sudo rm "$TMP_PATH"

