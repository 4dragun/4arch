#!/usr/bin/env bash
YU="yay -U --needed --noconfirm"
YS="yay -S --needed --noconfirm"

read -p "configure NVCHAD..? " nas
if [[ $nas = y ]]; then
  rm -rf ~/.config/nvim && mkdir ~/.config/nvim
  git clone https://github.com/NvChad/starter ~/.config/nvim
  nvim ~/.config/nvim/lua/chadrc.lua
else
  echo "skipped NVCHAD setup..!"
fi

fish ignore-this-shyit

read -p "copy/overwrite DOTFILES, ICONS, THEMES..? " itd
if [[ $itd = y ]]; then
  mkdir ~/.icons
  mkdir ~/.local/share/icons
  mkdir ~/.themes
  mkdir ~/.local/share/themes
  mkdir ~/.config/Kvantum

  tar -xf ~/4arch/icandy/BeautyLine.tar.gz -C ~/.icons
  tar -xf ~/4arch/icandy/BeautyLine.tar.gz -C ~/.local/share/icons
  tar -xf ~/4arch/icandy/Sweet-Dark.tar.xz -C ~/.themes
  tar -xf ~/4arch/icandy/Sweet-Dark.tar.xz -C ~/.local/share/themes
  tar -xf ~/4arch/icandy/Sweet.tar.xz      -C ~/.config/Kvantum
  
  cp -r ~/4arch/confs/fish          ~/.config
  cp -r ~/4arch/confs/fuzzel        ~/.config
  cp -r ~/4arch/confs/hypr          ~/.config
  cp -r ~/4arch/confs/kitty         ~/.config
  cp -r ~/4arch/confs/swaync        ~/.config
  cp -r ~/4arch/confs/swayosd       ~/.config
  cp -r ~/4arch/confs/uwsm          ~/.config
  cp -r ~/4arch/confs/waybar        ~/.config
  cp -r ~/4arch/confs/starship.toml ~/.config
else
  echo "skipped DOTFILES, ICONS, THEMES setup..!"
fi

read -p "install YAY - Yet Another AUR Helper..? " yas
if [[ $yas = y ]]; then
  rm -rf ~/yay-bin
  sudo pacman -S --needed --noconfirm git base-devel
  git clone https://aur.archlinux.org/yay-bin.git
  cd yay-bin && makepkg -si && cd && yay
else
  echo "skipped YAY setup..!"
fi

read -p "configure CHAOTIC-AUR repo..? " cas
if [[ $cas = y ]]; then
  sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
  sudo pacman-key --lsign-key 3056513887B78AEB
  $YU 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'
  $YU 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
else
  echo "skipped CHAOTIC-AUR setup..!"
fi

read -p "shit went down..? REBOOT now..? " ras
if [[ $ras = y ]]; then
  sync && sync && sync && systemctl reboot
fi

export EDITOR=nvim
sudoedit /etc/pacman.conf && yay

echo "installing AUR-apps..."
$YS clipse-bin

echo "installing DEPENDENCIES..."
$YS ffmpegthumbnailer python-pillow bibata-cursor-theme tumbler gvfs gvfs-mtp

echo "installing FONTS..."
$YS noto-fonts noto-fonts-cjk noto-fonts-extra otf-font-awesome
$YS noto-fonts-emoji otf-comicshanns-nerd

echo "installing HYPRLAND-stuff..."
$YS hyprland xdg-desktop-portal-hyprland xdg-desktop-portal-gtk uwsm kitty
$YS qt5-wayland hypridle hyprlock hyprpicker hyprpolkitagent hyprpaper

echo "installing GUI-apps..."
$YS sddm brave emote pavucontrol telegram-desktop mpv eog file-roller
$YS firefox nwg-look blueman qbittorrent swaync reflector-simple
$YS waybar nwg-look qt6ct kvantum fuzzel network-manager-applet
$YS thunar thunar-archive-plugin thunar-media-tags-plugin

echo "installing CLI-apps..."
$YS lsd bat grimblast pacseek fastfetch htop btop udiskie
$YS git-credential-manager-bin yazi wl-clipboard brightnessctl
$YS lua-language-server power-profiles-daemon xdg-user-dirs

xdg-user-dirs-update

echo "enabling POWER-PROFILES-DAEMON..."
sudo systemctl enable --now power-profiles-daemon

read -p "start DISPLAY-MANAGER (sddm)..? " das
if [[ $das = y ]]; then
  sync && sync && sync
  sudo systemctl enable --now sddm
else
  echo "DISPLAY-MANAGER not started, script ended..!"
fi
