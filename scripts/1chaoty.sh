#!/usr/bin/env bash

cd && echo "Welcome Back ARCHY"
read -p "click Enter to continue..."

echo "configuring YAY..."
cd && rm -rf ~/yay-bin
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin && makepkg -si
cd && echo YAY installed successfully!

echo "updating SYSTEM..." && yay

E="echo y"
Y="yay -S --needed"

echo "installing FONTS"
$E|$Y ttf-jetbrains-mono-nerd noto-fonts noto-fonts-cjk
$E|$Y noto-fonts-extra noto-fonts-emoji

echo "installing HYPRLAND STUFF"
$E|$Y hyprland xdg-desktop-portal-hyprland xdg-desktop-portal-gtk
$E|$Y qt5-wayland hypridle hyprlock hyprpicker

kitty brightnessctl wl-clipboard uwsm fish
bibata-cursor-theme catppuccin-gtk-theme-mocha
lsd bat swww lua-language-server flatpak
git-credential-manager-bin

yazi brave emote pavucontrol
telegram-desktop lsd bat nautilus mpv eog grimblast
fuzzel pacseek nwg-look fastfetch htop blueman btop
qt5ct qt6ct kvantum-qt5 power-profiles-daemon
ffmpegthumbnailer python-pillow

sudo systemctl enable --now power-profiles-daemon

echo CONFIGURING DOTFILES......................................................
rm -rf ~/.config/uwsm
mkdir ~/.config/uwsm
cp ~/4end/confs/env ~/.config/uwsm

rm -rf ~/.config/kitty
mkdir ~/.config/kitty
cp ~/4end/confs/kitty.conf ~/.config/kitty
cp ~/4end/confs/Catppuccin-Mocha.conf ~/.config/kitty

mkdir ~/.config/fuzzel
cp ~/4end/confs/fuzzel.ini ~/.config/fuzzel

rm -rf ~/.config/hypr
mkdir ~/.config/hypr
cp ~/4end/confs/hyprland.conf ~/.config/hypr
cp ~/4end/confs/hypridle.conf ~/.config/hypr
cp ~/4end/confs/hyprlock.conf ~/.config/hypr

