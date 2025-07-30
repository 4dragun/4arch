#!/usr/bin/env bash

COLORS=$(papirus-folders -l)

SEL_COLOR=$(echo "$COLORS" | fzf --prompt=" Pick a folder color: ")

SEL_COLOR=$(echo "$SEL_COLOR" | xargs)

if [ -n "$SEL_COLOR" ]; then
  echo
  echo " -> Applying color: $SEL_COLOR"
  echo
  papirus-folders -C "$SEL_COLOR" || { echo; read -p ""; exit; }
  echo
  read -p " -> Done! Restart your apps to see changes."
else
  echo
  read -p " -> No color selected. Exiting."
fi
