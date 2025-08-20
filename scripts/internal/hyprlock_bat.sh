#!/usr/bin/env bash

BATTERY=$(cat /sys/class/power_supply/BAT0/capacity)

STATE=$(cat /sys/class/power_supply/BAT0/status)

if [[ "$STATE" == "Charging" ]]; then
  ICON="󱐌"
elif [[ "$STATE" == "Full" ]]; then
  ICON="  "
elif [[ "$STATE" == "Discharging" ]]; then
  if (( BATTERY > 80 )); then
    ICON="  "
  elif (( BATTERY > 60 )); then
    ICON="  "
  elif (( BATTERY > 40 )); then
    ICON="  "
  elif (( BATTERY > 20 )); then
    ICON="  "
  else
    ICON="  "
  fi
else
  ICON="???"
fi

echo "$ICON $BATTERY% $STATE"
