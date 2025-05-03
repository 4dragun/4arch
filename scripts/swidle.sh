#!/usr/bin/env bash
killall swayidle
swayidle -w \
  timeout 10 'swaylock -f' \
  timeout 12 'brightnessctl -rs && niri msg output eDP-1 off' \
  resume 'brightnessctl -r && niri msg output eDP-1 on' \
  before-sleep 'brightnessctl -rs && swaylock -f'\
  timeout 16 'brightnessctl -rs && systemctl hibernate'
