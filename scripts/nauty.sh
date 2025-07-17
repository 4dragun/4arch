#!/usr/bin/env bash

nautilus &

sleep 1

while hyprctl clients | grep -iq 'class: org.gnome.Nautilus'; do
  sleep 1
done

killall nautilus 2>/dev/null
