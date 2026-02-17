#!/usr/bin/env bash

B="Bluetooth"

SN="bluetooth"

AI="$HOME/.local/share/icons/matutela/scalable/apps/bluetooth-active.svg"
II="$HOME/.local/share/icons/matutela/scalable/apps/bluetooth-inactive.svg"

SAHF="service activation has failed"

SS="$(systemctl is-active "$SN")"

if [ "$SS" == "inactive" ]; then
  echo -e "\n$B is $SS\n"
  systemctl start "$SN" || { notify-send -i "$II" "$B" "$SAHF"; exit; }
  notify-send -i "$AI" "$B" "service has been activated"
  blueman-applet & exit
elif [ "$SS" == "active" ]; then
  echo -e "\n$B is $SS\n"
  notify-send -i "$AI" "$B" "service is already active"
fi
