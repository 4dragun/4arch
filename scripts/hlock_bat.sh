#!/usr/bin/env bash

battery=$(cat /sys/class/power_supply/BAT0/capacity)
state=$(cat /sys/class/power_supply/BAT0/status)

if [[ "$state" == "Charging" ]]; then
  icon="󱐌"
elif [[ "$state" == "Full" ]]; then
  icon="  "
elif [[ "$state" == "Discharging" ]]; then
  if (( battery > 80 )); then
    icon="  "
  elif (( battery > 60 )); then
    icon="  "
  elif (( battery > 40 )); then
    icon="  "
  elif (( battery > 20 )); then
    icon="  "
  else
    icon="  "
  fi
else
  icon="???"
fi

echo "$icon $battery% $state"

