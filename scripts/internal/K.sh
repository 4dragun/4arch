#!/usr/bin/env bash

K="erase deliver pig moment chimney exit essay faith anchor twin \
   strong rebuild perfect pipe shadow license salute flip fashion \
   follow boil run kitchen"

I="$HOME/4arch/azzets/4.png"

wl-copy -n $K || { exit; }

notify-send "Archy Linux" "finished" -i "$I"
