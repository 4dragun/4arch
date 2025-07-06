#!/usr/bin/env bash

SN="bluetooth"

systemctl start "$SN"

SS="$(systemctl is-active "$SN")"

if [ "$SS" = "active" ]; then
  notify-send "🔵 Bluetooth" "Bluetooth service is active ✅"
  blueman-manager
else
  notify-send "🔴 Bluetooth" "Bluetooth service is inactive ❌"
fi
