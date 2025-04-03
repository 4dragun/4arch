#!/usr/bin/env bash
YU="yay -U --needed --noconfirm"
YS="yay -S --needed --noconfirm"

echo "FISH test incoming..." && fish ignore_this_mone

read -p "copy/overwrite DOTFILES, ICONS, THEMES..? " dit
if [[ $dit = y ]]; then
  cp -r ~/4arch/confs/fuzzel      ~/.config
  cp -r ~/4arch/confs/hypr        ~/.config
  cp -r ~/4arch/confs/kitty       ~/.config
  cp -r ~/4arch/confs/swaync      ~/.config
  cp -r ~/4arch/confs/uwsm        ~/.config
  cp -r ~/4arch/confs/waybar      ~/.config
  cp -r ~/4arch/confs/config.fish ~/.config/fish

  mkdir ~/.icons
  mkdir ~/.local/share/icons
  mkdir ~/.themes
  mkdir ~/.local/share/themes

  cp -r ~/4arch/eyecandy/BeautyLine ~/.icons
  cp -r ~/4arch/eyecandy/BeautyLine ~/.local/share/icons
  cp -r ~/4arch/eyecandy/Sweet-Dark ~/.themes
  cp -r ~/4arch/eyecandy/Sweet-Dark ~/.local/share/themes
  cp -r ~/4arch/eyecandy/Kvantum    ~/.config
else
  echo "skipped DOTFILES setup..!"
fi

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

sudo nvim /etc/pacman.conf && yay

echo "installing AUR-apps..."
$Y clipse-bin

echo "installing DEPENDENCIES..."
$Y ffmpegthumbnailer python-pillow bibata-cursor-theme

echo "installing FONTS..."
$Y noto-fonts noto-fonts-cjk noto-fonts-extra
$Y noto-fonts-emoji ttf-jetbrains-mono-nerd ttf-fira-sans

echo "installing HYPRLAND-stuff..."
$Y hyprland xdg-desktop-portal-hyprland xdg-desktop-portal-gtk uwsm kitty
$Y qt5-wayland hypridle hyprlock hyprpicker hyprpolkitagent hyprpaper

echo "installing GUI-apps..."
$Y sddm brave emote pavucontrol telegram-desktop nautilus mpv eog
$Y librewolf fuzzel nwg-look blueman qbittorrent swaync swayosd-git
$Y waybar nwg-look qt6ct kvantum fuzzel

echo "installing CLI-apps..."
$Y lsd bat grimblast pacseek fastfetch htop btop udiskie
$Y git-credential-manager-bin yazi wl-clipboard brightnessctl
$Y lua-language-server power-profiles-daemon

echo "enabling SERVICES..."
sudo systemctl enable power-profiles-daemon
sudo systemctl enable sddm

read -p "REBOOTING IN NEXT STEP, CLICK TO CANCEL..."
systemctl reboot
