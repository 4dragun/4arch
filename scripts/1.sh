#!/usr/bin/env bash

E="echo y"
P="sudo pacman -S --needed"

$E|$P wl-clipboard hyprland uwsm fish kitty yazi neovim brightnessctl

echo CONFIGURING DOTFILES 
cp -r ~/4arch/confs/uwsm ~/.config/

cp -r ~/4arch/confs/kitty ~/.config/

cp -r ~/4arch/confs/fuzzel ~/.config/

cp -r ~/4arch/confs/hypr ~/.config/

cp -r ~/4arch/confs/config.fish ~/.config/fish

uwsm start hyprland
