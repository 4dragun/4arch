#!/usr/bin/env bash

k="erase deliver pig moment chimney exit essay faith anchor twin \
   strong rebuild perfect pipe shadow license salute flip fashion \
   follow boil run kitchen"

i="$HOME/4arch/azzets/4.png"

wl-copy -n $k || { exit; }

notify-send "Archy Linux" "finished" -i "$i"
