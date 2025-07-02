#!/usr/bin/env bash

YU="yay -U --needed --noconfirm"
YS="yay -S --needed --noconfirm"

echo && echo ".......WELCOME TO 4ARCH Script......." && echo

fish ignore-this-shyit

echo && read -p "configure DOTFILES, ICONS, THEMES..? (y/n)  " itd
echo && read -p "install YAY - Yet Another AUR Helper..? (y/n)  " yas
echo && read -p "configure CHAOTIC-AUR repo..? (y/n)  " cas

if [[ $itd = y ]]; then
  echo && mkdir -p ~/.icons
          mkdir -p ~/.local/share/icons
  tar -xf ~/4arch/azzets/kora.tar.xz -C ~/.icons
  tar -xf ~/4arch/azzets/kora.tar.xz -C ~/.local/share/icons
  
  echo && rm -rf ~/.config/nvim
          rm -rf ~/.local/state/nvim
          rm -rf ~/.local/share/nvim

  echo && echo "CLONING NvChad..." && echo
  git clone https://github.com/NvChad/starter ~/.config/nvim && echo
  
  cp -r ~/4arch/confs ~/.config
else
  echo && echo "skipped DOTFILES, ICONS, THEMES setup..!" && echo
fi

if [[ $yas = y ]]; then
  echo && rm -rf ~/yay-bin && echo
  
  sudo pacman -S --needed --noconfirm git base-devel
  git clone https://aur.archlinux.org/yay-bin.git
  cd yay-bin && makepkg -si --noconfirm && cd && yay --noconfirm
  echo
else
  echo && echo "skipped YAY setup..!" && echo
fi

if [[ $cas = y ]]; then
  echo && echo "Setting up CHAOTIC-AUR now..." && echo
  sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
  sudo pacman-key --lsign-key 3056513887B78AEB
  $YU 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'
  $YU 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
else
  echo && echo "skipped CHAOTIC-AUR setup..!" && echo
fi

echo && read -p "shit went down..? REBOOT now..? (y/n)  " ras
if [[ $ras = y ]]; then
  echo && sync && sync && sync && systemctl reboot
else
  echo && echo "CHAOTIC-AUR stuff SUCCESSFUL...!" && echo
fi

export EDITOR=nvim
sudoedit /etc/pacman.conf && yay --noconfirm

echo "installing AUR-apps..."
$YS clipse-bin ttf-rubik-vf matugen-bin

echo "installing DEPENDENCIES..."
$YS ffmpegthumbnailer python-pillow bibata-cursor-theme
$YS adw-gtk-theme gvfs-mtp

echo "installing FONTS..."
$YS noto-fonts noto-fonts-cjk noto-fonts-extra ttf-font-awesome
$YS noto-fonts-emoji ttf-jetbrains-mono-nerd

echo "installing HYPRLAND-stuff..."
$YS hyprland xdg-desktop-portal-hyprland xdg-desktop-portal-gtk uwsm grimblast
$YS qt5-wayland hypridle hyprlock hyprpicker hyprpolkitagent hyprpaper

echo "installing GUI-apps..."
$YS sddm brave emote pavucontrol telegram-desktop mpv eog rofi-wayland
$YS firefox nwg-look blueman qbittorrent swaync reflector-simple
$YS waybar nwg-look qt6ct network-manager-applet nautilus

echo "installing CLI-apps..."
$YS fzf lsd bat pacseek fastfetch htop btop udiskie ghostty wget
$YS git-credential-manager-bin yazi wl-clipboard brightnessctl starship
$YS lua-language-server power-profiles-daemon xdg-user-dirs aria2

xdg-user-dirs-update && mkdir -p ~/Pictures/Screenshots

matugen image ~/4arch/walls/Fantasy-Hongkong.png -c ~/.config/matugen/init.toml
echo "/home/archy/4arch/walls/Fantasy-Hongkong.png">"$HOME/.cache/last-wall.txt"

echo "enabling POWER-PROFILES-DAEMON..."
sudo systemctl enable --now power-profiles-daemon

#type here

read -p "start DISPLAY-MANAGER (sddm)..? " das
if [[ $das = y ]]; then
  sync && sync && sync
  sudo systemctl enable --now sddm
else
  echo "DISPLAY-MANAGER not started, script ended..!"
fi
