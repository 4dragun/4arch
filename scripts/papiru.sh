#!/usr/bin/env bash

colors=$(papirus-folders -l)

sel_color=$(echo "$colors" | fzf --prompt=" Pick a folder color: ")

sel_color=$(echo "$sel_color" | xargs)

if [ -n "$sel_color" ]; then
  echo
  echo " -> Applying color: $sel_color"
  echo
  papirus-folders -C "$sel_color" || { echo; read -p ""; exit; }
  echo
  read -p " -> Done! Restart your apps to see changes."
else
  echo
  read -p " -> No color selected. Exiting."
fi
