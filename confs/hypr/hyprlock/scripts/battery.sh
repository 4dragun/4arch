#!/usr/bin/env bash

# Path to battery info
BAT_PATH="/sys/class/power_supply/BAT0"

# Read values
BATTERY=$(cat "$BAT_PATH/capacity")
STATE=$(cat "$BAT_PATH/status")

case "$STATE" in
    "Charging")
        ICON=""
        ;;
    "Full")
        ICON="󰁹"
        ;;
    "Discharging")
        case $BATTERY in
            9[1-9]|100) ICON="󰂂" ;;
            8[1-9]|90)  ICON="󰂁" ;;
            7[1-9]|80)  ICON="󰂀" ;;
            6[1-9]|70)  ICON="󰁿" ;;
            5[1-9]|60)  ICON="󰁾" ;;
            4[1-9]|50)  ICON="󰁽" ;;
            3[1-9]|40)  ICON="󰁼" ;;
            2[1-9]|30)  ICON="󰁻" ;;
            1[1-9]|20)  ICON="󰁺" ;;
            *)          ICON="󰂎" ;;
        esac
        ;;
    *)
        ICON="???"
        ;;
esac

# Output format exactly like your old script
echo "$ICON $BATTERY% $STATE"
