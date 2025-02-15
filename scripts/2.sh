#!/usr/bin/env bash
N="sudoedit"
E="echo y"
W="wl-copy -n"
Y="yay -S --needed"

cd && read -p "click Enter to continue... "
swww img ~/4arch/walls/train-sideview.png

read -p "configure NVCHAD..? " nas
if [[ $nas = y ]]; then
  $W < ~/4arch/scripts/scriptiles/nvhypr.sh
  rm -rf ~/.config/nvim && mkdir ~/.config/nvim
  git clone https://github.com/NvChad/starter ~/.config/nvim
  nvim ~/.config/nvim/init.lua
else
  echo "skipped NVCHAD setup..!"
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

read -p "sudoedit SYSTEM-files..? " sas
if [[ $sas = y ]]; then
  $W < ~/4arch/scripts/scriptiles/chaoty.sh
  $N /etc/pacman.conf && yay

  $W HandlePowerKey=suspend-then-hibernate
  $N /etc/systemd/logind.conf

  $W HibernateDelaySec=2400s
  $N /etc/systemd/sleep.conf

  $W "/swapfile none swap defaults 0 0"
  $N /etc/fstab

  $W resume
  $N /etc/mkinitcpio.conf
else
  echo "skipped SYSTEM-files editing..!"
fi

read -p "configure SWAP-file..? " was
if [[ $was = y ]]; then
  sudo mkswap -U clear --size 8G --file /swapfile
  sudo swapon /swapfile
else
  echo "skipped SWAP-file creation..!"
fi

read -p "configure FISH as interactive shell..? " fas
if [[ $fas = y ]]; then
  $W < ~/4arch/scripts/scriptiles/bafish.sh
  nvim ~/.bashrc
else
  echo "skipped bafish configuration..!"
fi

read -p "install a GTK-theme..? " gas
if [[ $gas = y ]]; then
  git clone https://github.com/Fausto-Korpsvart/Catppuccin-GTK-Theme
  cd ~/Catppuccin-GTK-Theme/themes
  ./install.sh -l -c dark --tweaks float macos && cd
else
  echo "skipped GTK-theme installation..!"
fi
read -p "install a QT-theme..? " qas
if [[ $qas = y ]]; then
  git clone https://github.com/catppuccin/Kvantum
  kvantummanager
else
  echo "skipped QT-theme installation..!"
fi

echo "installing AUR-apps..."
$Y clipse-bin ags-hyprpanel-git

read -p "regenerate INITRAMFS..? " ias
if [[ $ias = y ]]; then
  sudo mkinitcpio -P
else
  echo "skipped INITRAMFS regeneration..!"
fi

yay

echo "installing FONTS..."
$E|$Y noto-fonts noto-fonts-cjk noto-fonts-extra
$E|$Y noto-fonts-emoji

echo "installing HYPRLAND-stuff..."
$E|$Y xdg-desktop-portal-hyprland xdg-desktop-portal-gtk
$E|$Y qt5-wayland hypridle hyprlock hyprpicker hyprpolkitagent

echo "installing GUI-apps..."
$E|$Y brave emote pavucontrol telegram-desktop nautilus mpv eog
$E|$Y librewolf fuzzel nwg-look blueman qbittorrent sddm

echo "installing CLI-apps..."
$E|$Y lsd bat grimblast pacseek fastfetch htop btop udiskie
$E|$Y power-profiles-daemon git-credential-manager-bin
$E|$Y lua-language-server gnome-boxes

echo "installing DEPENDENCIES..."
$E|$Y ffmpegthumbnailer python-pillow bibata-cursor-theme

echo "enabling SERVICES..."
sudo systemctl enable power-profiles-daemon
sudo systemctl enable sddm

read -p "finished script execution, REBOOT now..? " ras
if [[ $ras = y ]]; then
  reboot
else
  echo "please REBOOT manually..!"
fi
