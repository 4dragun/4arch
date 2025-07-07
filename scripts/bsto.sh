#!/usr/bin/env bash

B="Bluetooth"

SN="bluetooth"

PA="$HOME/4arch/azzets/bactive.png"
PI="$HOME/4arch/azzets/binactive.png"

SDHF="service deactivation has failed"

SS="$(systemctl is-active "$SN")"

if [ "$SS" = "inactive" ]; then
  notify-send -i "$PI" "$B" "service is not already running" && exit
fi

if [ "$SS" = "active" ]; then
  systemctl stop "$SN" || { notify-send -i "$PA" "$B" "$SDHF" && exit;}
  
  killall blueman-applet
  killall blueman-manager
  notify-send -i "$PI" "$B" "service has been deactivated"
fi

