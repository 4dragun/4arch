#!/usr/bin/env bash

KEEP="erase deliver pig moment chimney exit essay faith anchor twin \
      strong rebuild perfect pipe shadow license salute flip fashion \
      follow boil run kitchen"

ICON="$HOME/.local/share/icons/matutela/scalable/apps/kalu.svg"

wl-copy -n $KEEP || exit

notify-send "Archy Linux" "finished" -i "$ICON"
