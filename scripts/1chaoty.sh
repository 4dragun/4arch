#!/usr/bin/env bash

cd && echo "Welcome Back ARCHY"
read -p "click Enter to continue..."

echo "configuring YAY..."
cd && rm -rf ~/yay-bin
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin && makepkg -si && cd

echo "updating SYSTEM..." && yay

E="echo y"
Y="yay -S --needed"

echo "installing FONTS"
$E|$Y ttf-jetbrains-mono-nerd noto-fonts noto-fonts-cjk
$E|$Y noto-fonts-extra noto-fonts-emoji

echo "installing HYPRLAND STUFF"
$E|$Y hyprland xdg-desktop-portal-hyprland xdg-desktop-portal-gtk
$E|$Y qt5-wayland hypridle hyprlock hyprpicker

echo "installing GUI APPS"
$E|$Y brave emote pavucontrol telegram-desktop nautilus mpv eog
$E|$Y fuzzel nwg-look blueman kitty qt5ct qt6ct kvantum-qt5 sddm

echo "installing CLI APPS"
$E|$Y yazi lsd bat grimblast pacseek fastfetch htop btop swww
$E|$Y power-profiles-daemon brightnessctl wl-clipboard uwsm fish
$E|$Y lua-language-server flatpak git-credential-manager-bin 

echo "installing few DEPENDENCIES"
$E|$Y ffmpegthumbnailer python-pillow bibata-cursor-theme

echo "installing THEME" && cd
git clone https://github.com/Fausto-Korpsvart/Catppuccin-GTK-Theme
cd ~/Catppuccin-GTK-Theme/themes && ./install.sh && cd

echo "enabling system SERVICES"
sudo systemctl enable power-profiles-daemon
sudo systemctl enable sddm

echo CONFIGURING DOTFILES 
mkdir ~/.config/uwsm
cp -r ~/4end/confs/env ~/.config/uwsm

mkdir ~/.config/kitty
cp -r ~/4end/confs/kitty.conf ~/.config/kitty
cp -r ~/4end/confs/Catppuccin-Mocha.conf ~/.config/kitty

mkdir ~/.config/fuzzel
cp -r ~/4end/confs/fuzzel.ini ~/.config/fuzzel

mkdir ~/.config/hypr
cp -r ~/4end/confs/hyprland.conf ~/.config/hypr
cp -r ~/4end/confs/hypridle.conf ~/.config/hypr
cp -r ~/4end/confs/hyprlock.conf ~/.config/hypr

