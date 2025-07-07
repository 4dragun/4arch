#!/usr/bin/env bash

SN="bluetooth"

systemctl start "$SN"

SS="$(systemctl is-active "$SN")"

if [ "$SS" = "active" ]; then
  notify-send -i "$HOME/4arch/azzets/bactive.png" "Bluetooth" "Bluetooth service is active"
  blueman-manager
else
  notify-send -i "$HOME/4arch/azzets/binactive.png" "Bluetooth" "Bluetooth service is inactive"
fi
