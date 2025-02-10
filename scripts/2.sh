#!/usr/bin/env bash
N="sudo nvim"
E="echo y"
W="wl-copy -n"
Y="yay -S --needed"

cd && echo "Welcome Back ARCHY"
read -p "click Enter to continue..."

echo "configuring NEOVIM"
read -p "proceed..?" nas
if [[ $nas = y ]]; then
  $W < ~/4arch/scripts/scriptiles/nvhypr.sh
  rm -rf ~/.config/nvim && mkdir ~/.config/nvim
  git clone https://github.com/NvChad/starter ~/.config/nvim
  nvim ~/.config/nvim/init.lua
else
  echo "skipping NEOVIM setup"
fi

echo "configuring bash-fish stuff..."
read -p "wanna edit .bashrc..? ;) hmm?? " bas
if [[ $bas = y ]]; then
  $W < ~/4arch/scripts/scriptiles/bafish.sh
  nvim ~/.bashrc
else
  echo "skipping bafi stuff"
fi

echo "configuring YAY..."
read -p "proceed..?" yas
if [[ $yas = y ]]; then
  cd && rm -rf ~/yay-bin
  sudo pacman -S --needed git base-devel
  git clone https://aur.archlinux.org/yay-bin.git
  cd yay-bin && makepkg -si && cd && yay
else
  echo "skipping YAY setup..."
fi

echo "configuring SYSTEM files"
read -p "continue?" sas
if [[ $sas = y ]]; then
  $W < ~/4arch/scripts/scriptiles/chaoty.sh
  $N /etc/pacman.conf

  $W HandlePowerKey=suspend-then-hibernate
  $N /etc/systemd/logind.conf

  $W HibernateDelaySec=2400s
  $N /etc/systemd/sleep.conf

  $W "/swapfile none swap defaults 0 0"
  $N /etc/fstab

  $W resume
  $N /etc/mkinitcpio.conf
else
  echo "skipping system files editings..."
fi

echo "creating SWAP file..."
read -p "continue..?" swas
if [[ $swas = y ]]; then
  sudo mkswap -U clear --size 8G --file /swapfile
  sudo swapon /swapfile
else
  echo "skipping swap file creation!"
fi

echo "...UPDAting system..." && yay

echo "installing AUR apps"
$Y clipse-bin ags-hyprpanel-git

echo "installing FONTS"
$E|$Y ttf-jetbrains-mono-nerd noto-fonts noto-fonts-cjk
$E|$Y noto-fonts-extra noto-fonts-emoji

echo "installing HYPRLAND STUFF"
$E|$Y hyprland xdg-desktop-portal-hyprland xdg-desktop-portal-gtk
$E|$Y qt5-wayland hypridle hyprlock hyprpicker hyprpolkitagent

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

# echo CONFIGURING DOTFILES 
# cp -r ~/4arch/confs/uwsm ~/.config/
#
# cp -r ~/4arch/confs/kitty ~/.config/
#
# cp -r ~/4arch/confs/fuzzel ~/.config/
#
# cp -r ~/4arch/confs/hypr ~/.config/
#
# cp -r ~/4arch/confs/config.fish ~/.config/fish

swww-daemon &
swww img ~/4arch/walls/train-sideview.png

echo "regenerating the initramfs..."
sudo mkinitcpio -P

echo ">>>FINISHED SCRIPT EXECUTION..."
read -p "REBOOT now ?" ras
if [[ $ras = y ]]; then
  reboot
else
  echo "please REBOOT manually!"
fi
