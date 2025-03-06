#!/usr/bin/env bash

YU="yay -U --needed --noconfirm"
YS="yay -S --needed --noconfirm"

read -p "install YAY - Yet Another AUR Helper..? " yas
if [[ $yas = y ]]; then
  rm -rf ~/yay-bin
  sudo pacman -S --needed git base-devel
  git clone https://aur.archlinux.org/yay-bin.git
  cd yay-bin && makepkg -si && cd && yay
else
  echo "skipped YAY setup..!"
fi

read -p "configure CHAOTIC-AUR repo..? " cas
if [[ $cas = y ]]; then
  yay
  sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
  sudo pacman-key --lsign-key 3056513887B78AEB
  $YU 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'
  $YU 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
else
  echo "skipped CHAOTIC-AUR setup..!"
fi

read -p "shit went down..? REBOOT now..? " ras
if [[ $ras = y ]]; then
  reboot
fi

read -p "install critical PROGRAMMSSS..? " pas
if [[ $pas = y ]]; then
  $YS wl-clipboard hyprland uwsm kitty yazi brightnessctl bibata-cursor-theme
  $YS ttf-jetbrains-mono-nerd qt5ct qt6ct kvantum-qt5 swww
else
  echo "skipped critical PROGRAMMSSS installation..!"
fi

echo "FISH test incoming..." && fish ignorethiserrormone

read -p "copy/overwrite DOTFILES..? " das
if [[ $das = y ]]; then
  cp -r ~/4arch/confs/fuzzel ~/.config
  cp -r ~/4arch/confs/hypr ~/.config
  cp -r ~/4arch/confs/kitty ~/.config
  cp -r ~/4arch/confs/uwsm ~/.config
  cp -r ~/4arch/confs/config.fish ~/.config/fish
  cp -r ~/4arch/confs/mepanel.json ~/.config
else
  echo "skipped DOTFILES setup..!"
fi

read -p "start HYPRLAND via uwsm..? " has
if [[ $has = y ]]; then
  uwsm start hyprland.desktop
else
  echo "enter HYPRLAND manually..!"
fi
