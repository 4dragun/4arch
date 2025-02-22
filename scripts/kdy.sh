#!/usr/bin/env bash

EY="echo y"
PU="sudo pacman -U"
PS="sudo pacman -S --needed --noconfirm"
N="sudo nano"
W="wl-copy -n"
Y="yay -S --needed --noconfirm"

echo "Installing critical apps..."
sudo pacman -Syu
$PS fish wl-clipboard inkscape fastfetch htop btop kvantum

read -p "configure CHAOTIC-AUR repo..? " cas
if [[ $cas = y ]]; then
  sudo pacman -Syu
  sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
  sudo pacman-key --lsign-key 3056513887B78AEB
  $EY|$PU 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'
  $EY|$PU 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
else
  echo "skipped CHAOTIC-AUR setup..!"
fi

read -p "shit went down..? REBOOT now..? " ras
if [[ $ras = y ]]; then
  reboot
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

read -p "regenerate INITRAMFS..? " ias
if [[ $ias = y ]]; then
  sudo mkinitcpio -P
else
  echo "skipped INITRAMFS regeneration..!"
fi

$Y noto-fonts noto-fonts-cjk noto-fonts-extra
$Y noto-fonts-emoji ttf-jetbrains-mono-nerd
$Y brave telegram-desktop qbittorrent gnome-boxes

read -p "finished script execution, REBOOT now..? " ras
if [[ $ras = y ]]; then
  reboot
else
  echo "please REBOOT manually..!"
fi
