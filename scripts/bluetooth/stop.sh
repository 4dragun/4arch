#!/usr/bin/env bash

B="Bluetooth"

SN="bluetooth"

AI="$HOME/4arch/assets/blactive.png"
II="$HOME/4arch/assets/blinactive.png"

SDHF="service deactivation has failed"

SS="$(systemctl is-active "$SN")"

if [ "$SS" == "inactive" ]; then
  echo
  echo "$B is $SS"
  echo
  notify-send -i "$II" "$B" "service is not running"
  exit
elif [ "$SS" == "active" ]; then
  echo
  echo "$B is $SS"
  echo
  systemctl stop "$SN" || { notify-send -i "$AI" "$B" "$SDHF"; exit;}
  killall blueman-applet
  killall blueman-manager
  notify-send -i "$II" "$B" "service has been deactivated"
fi
