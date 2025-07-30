#!/usr/bin/env bash

A="erase deliver pig moment chimney exit essay faith anchor twin"
B="strong rebuild perfect pipe shadow license salute flip fashion"
C="follow boil run kitchen"

I="$HOME/4arch/azzets/4.png"

wl-copy -n $A $B $C || { exit; }

notify-send "ARCHY" "done" -i "$I"
