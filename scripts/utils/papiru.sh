#!/usr/bin/env bash

COLORS=$(papirus-folders -l)

SEL_COLOR=$(echo "$COLORS" | fzf --prompt="> PICK A FOLDER COLOR: ")
SEL_COLOR=$(echo "$SEL_COLOR" | xargs)

if [ -n "$SEL_COLOR" ]; then
  echo -e "\n* APPLYING COLOR: $SEL_COLOR\n"
  papirus-folders -C "$SEL_COLOR" || { echo; read -p ""; exit; }
  echo; read -p "~ DONE! RESTART YOUR APPS TO SEE CHANGES. "
else
  echo; read -p "~ NO COLOR SELECTED. EXITING. "
fi
