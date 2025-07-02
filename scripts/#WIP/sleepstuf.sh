#!/usr/bin/env bash

CONF_PATH="/etc/systemd/sleep.conf"
sudo cp "$CONF_PATH" "$CONF_PATH.bak"

# Delete old HibernateDelaySec lines
sudo sed -i '/^HibernateDelaySec=/d' "$CONF_PATH"

# Insert new HibernateDelaySec=1800 line after [Sleep]
sudo sed -i '/^\[Sleep\]/a\
HibernateDelaySec=1800
' "$CONF_PATH"

