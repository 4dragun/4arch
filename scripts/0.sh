#!/usr/bin/env bash

EY="echo y"
PU="sudo pacman -U"
PS="sudo pacman -S --needed"

read -p "configure CHAOTIC-AUR repo..? " cas
if [[ $cas = y ]]; then
  sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
  sudo pacman-key --lsign-key 3056513887B78AEB
  $EY|$PU 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'
  $EY|$PU 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
else
  echo "skipped CHAOTIC-AUR setup..!"
fi

read -p "shit went down? REBOOT now..? " ras
if [[ $ras = y ]]; then
  reboot
fi

read -p "install critical PROGRAMMSSS..? " pas
if [[ $pas = y ]]; then
  $EY|$PS wl-clipboard hyprland uwsm fish kitty yazi neovim brightnessctl
else
  echo "skipped critical PROGRAMMSSS installation..!"
fi

read -p "copy/overwrite DOTFILES..? " das
if [[ $das = y ]]; then
  cp -r ~/4arch/confs/fuzzel ~/.config
  cp -r ~/4arch/confs/hypr ~/.config
  cp -r ~/4arch/confs/kitty ~/.config
  cp -r ~/4arch/confs/uwsm ~/.config
  cp -r ~/4arch/confs/config.fish ~/.config/fish
else
  echo "skipped DOTFILES configuration..!"
fi

read -p "start HYPRLAND via uwsm..? " has
if [[ $has = y ]]; then
  uwsm start hyprland.desktop
else
  echo "enter HYPRLAND manually..!"
fi
