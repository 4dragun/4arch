#!/usr/bin/env bash

B="Bluetooth"

SN="bluetooth"

PA="$HOME/4arch/azzets/bactive.png"
PI="$HOME/4arch/azzets/binactive.png"

SAHF="service activation has failed"

SS="$(systemctl is-active "$SN")"

if [ "$SS" = "inactive" ]; then
  echo
  echo " "$B" is "$SS" "
  echo
  systemctl start "$SN" || { notify-send -i "$PI" "$B" "$SAHF" && exit; }
  echo
  notify-send -i "$PA" "$B" "service has been activated"
  echo
  uwsm app -- blueman-applet
  echo
fi

if [ "$SS" = "active" ]; then
  echo
  notify-send -i "$PA" "$B" "service is already active"
  echo
fi
