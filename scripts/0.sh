#!/usr/bin/env bash

EY="echo y"
PU="sudo pacman -U"
PS="sudo pacman -S --needed"

echo "CHAOTIC-AUR setup...."
read -p "continue..? " cas
if [[ $cas = y ]]; then
  sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
  sudo pacman-key --lsign-key 3056513887B78AEB
  $EY|$PU 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'
  $EY|$PU 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
else
  echo "skipping chaotic-aur setup..!!!!"
fi

read -p "Wanna REBoot??? " ras
if [[ $ras = y ]]; then
  reboot
fi

echo "installing CRITICAL programsss..."
read -p "continue ? ??" pas
if [[ $pas = y ]]; then  
  $EY|$PS wl-clipboard hyprland uwsm fish kitty yazi neovim brightnessctl
  echo "installed CRITICal Stuff!!!"
fi

echo "CONFIGURING DOTFILES>>>"
  cp -r ~/4arch/confs/fuzzel ~/.config
  cp -r ~/4arch/confs/hypr ~/.config
  cp -r ~/4arch/confs/kitty ~/.config
  cp -r ~/4arch/confs/uwsm ~/.config
  cp -r ~/4arch/confs/config.fish ~/.config/fish

  echo "...starting HYPRLAAAANDDD >>>>>!!!!..."
  uwsm start hyprland.desktop
fi
