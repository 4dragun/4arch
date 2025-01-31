#!/usr/bin/env bash

eye="toilet -t --metal --font future"
p="PROCEED ..?"
chaoty="echo y|sudo pacman -U"

echo "WELCOME BACK ARCHY"|$eye
read -p "$p"

echo "CHAOTIC-AUR"|$eye
sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key 3056513887B78AEB
$chaoty 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'
$chaoty 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'

echo "CONFIGURING DOTFILES"|$eye
rm -rf ~/.config/hypr
cp -r ~/4arch/confs/hypr ~/.config

rm -rf ~/.config/uwsm
cp -r ~/4arch/confs/uwsm ~/.config

rm -rf ~/.config/kitty
cp -r ~/4arch/confs/kitty ~/.config

rm -rf ~/.config/fuzzel
cp -r ~/4arch/confs/fuzzel ~/.config
