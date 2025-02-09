#!/usr/bin/env bash

E="echo y"
P="sudo pacman -S --needed"

$E|$P wl-clipboard hyprland uwsm fish kitty yazi neovim brightnessctl

read -p "PROceeding..."
uwsm start hyprland
