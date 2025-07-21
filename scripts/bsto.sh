#!/usr/bin/env bash

B="Bluetooth"

SN="bluetooth"

PA="$HOME/4arch/azzets/bactive.png"
PI="$HOME/4arch/azzets/binactive.png"

SDHF="service deactivation has failed"

SS="$(systemctl is-active "$SN")"

if [ "$SS" = "inactive" ]; then
  echo
  echo " "$B" is "$SS" "
  echo
  notify-send -i "$PI" "$B" "service is not already running"
  echo
  exit
fi

if [ "$SS" = "active" ]; then
  echo
  echo " "$B" is "$SS" "
  echo
  systemctl stop "$SN" || { notify-send -i "$PA" "$B" "$SDHF" && exit;}
  echo
  killall blueman-applet
  killall blueman-manager
  echo
  notify-send -i "$PI" "$B" "service has been deactivated"
  echo
fi
