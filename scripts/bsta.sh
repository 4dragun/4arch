#!/usr/bin/env bash

B="Bluetooth"

SN="bluetooth"

PA="$HOME/4arch/azzets/bactive.png"
PI="$HOME/4arch/azzets/binactive.png"

SAHF="service activation has failed"

SS="$(systemctl is-active "$SN")"

if [ "$SS" = "inactive" ]; then
  systemctl start "$SN" || { notify-send -i "$PI" "$B" "$SAHF" && exit; }
  
  notify-send -i "$PA" "$B" "service has been activated"
  blueman-manager
fi
if [ "$SS" = "active" ]; then
  notify-send -i "$PA" "$B" "service is already active"
fi
