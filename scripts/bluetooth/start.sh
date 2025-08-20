#!/usr/bin/env bash

B="Bluetooth"

SN="bluetooth"

AI="$HOME/4arch/assets/blactive.png"
II="$HOME/4arch/assets/blinactive.png"

SAHF="service activation has failed"

SS="$(systemctl is-active "$SN")"

if [ "$SS" == "inactive" ]; then
  echo
  echo "$B is $SS"
  echo
  systemctl start "$SN" || { notify-send -i "$II" "$B" "$SAHF"; exit; }
  notify-send -i "$AI" "$B" "service has been activated"
  blueman-applet &
  exit
elif [ "$SS" == "active" ]; then
  echo
  echo "$B is $SS"
  echo
  notify-send -i "$AI" "$B" "service is already active"
fi
