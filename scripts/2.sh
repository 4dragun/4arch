#!/usr/bin/env bash
N="sudoedit"
W="wl-copy -n"
Y="yay -S --needed --noconfirm"

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

read -p "sudoedit SYSTEM-files..? " sas
if [[ $sas = y ]]; then
  $W < ~/4arch/scripts/scriptiles/chaoty.sh
  $N /etc/pacman.conf && yay

  $W HandlePowerKey=suspend-then-hibernate
  $N /etc/systemd/logind.conf

  $W HibernateDelaySec=2400s
  $N /etc/systemd/sleep.conf

  $W resume
  $N /etc/mkinitcpio.conf
else
  echo "skipped SYSTEM-files editing..!"
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

read -p "regenerate INITRAMFS..? " ias
if [[ $ias = y ]]; then
  sudo mkinitcpio -P
else
  echo "skipped INITRAMFS regeneration..!"
fi

yay

echo "installing AUR-apps..."
$Y clipse-bin ags-hyprpanel-git

echo "installing FONTS..."
$Y noto-fonts noto-fonts-cjk noto-fonts-extra
$Y noto-fonts-emoji

echo "installing HYPRLAND-stuff..."
$Y xdg-desktop-portal-hyprland xdg-desktop-portal-gtk
$Y qt5-wayland hypridle hyprlock hyprpicker hyprpolkitagent

echo "installing GUI-apps..."
$Y brave emote pavucontrol telegram-desktop nautilus mpv eog
$Y librewolf fuzzel nwg-look blueman qbittorrent sddm

echo "installing CLI-apps..."
$Y lsd bat grimblast pacseek fastfetch htop btop udiskie
$Y power-profiles-daemon git-credential-manager-bin
$Y lua-language-server

echo "installing DEPENDENCIES..."
$Y ffmpegthumbnailer python-pillow

echo "enabling SERVICES..."
sudo systemctl enable power-profiles-daemon
sudo systemctl enable sddm

read -p "finished script execution, REBOOT now..? " ras
if [[ $ras = y ]]; then
  reboot
else
  echo "please REBOOT manually..!"
fi
