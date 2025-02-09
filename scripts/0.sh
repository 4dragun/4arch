#!/usr/bin/env bash

E="echo y"
P="sudo pacman -U"

echo "CHAOTIC-AUR setup"
sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key 3056513887B78AEB
$E|$P 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'
$E|$P 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'

read -p "Wanna REBoot??? " ans
if [ $ans = y ]; then
  reboot
else
  cd ~/4arch/scripts/ && ./1.sh
fi
