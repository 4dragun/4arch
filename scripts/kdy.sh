#!/usr/bin/env bash

PU="sudo pacman -U --needed --noconfirm"
PS="sudo pacman -S --needed --noconfirm"
N="sudo nvim"
W="wl-copy -n"
Y="yay -S --needed --noconfirm"

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
  sudo pacman -Syu
  sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
  sudo pacman-key --lsign-key 3056513887B78AEB
  $PU 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'
  $PU 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
else
  echo "skipped CHAOTIC-AUR setup..!"
fi

read -p "shit went down..? REBOOT now..? " ras
if [[ $ras = y ]]; then
  reboot
fi

$N /etc/pacman.conf

read -p "configure FISH as interactive shell..? " fas
if [[ $fas = y ]]; then
  $W < ~/4arch/scripts/scriptiles/bafish.sh
  nvim ~/.bashrc
else
  echo "skipped bafish configuration..!"
fi

read -p "sudoedit SYSTEM-files..? " sas
if [[ $sas = y ]]; then

  $W HandlePowerKey=suspend-then-hibernate
  $N /etc/systemd/logind.conf

  $W HibernateDelaySec=2400
  $N /etc/systemd/sleep.conf

  $W resume
  $N /etc/mkinitcpio.conf
else
  echo "skipped SYSTEM-files editing..!"
fi

read -p "regenerate INITRAMFS..? " ias
if [[ $ias = y ]]; then
  sudo mkinitcpio -P
else
  echo "skipped INITRAMFS regeneration..!"
fi
 
$Y plasma-meta konsole ark dolphin nautilus
$Y noto-fonts noto-fonts-cjk noto-fonts-extra
$Y noto-fonts-emoji ttf-jetbrains-mono-nerd ttf-fira-sans
$Y brave telegram-desktop qbittorrent gnome-boxes
$Y git-credential-manager-bin inkscape
$Y lutris goverlay lib32-mangohud wine-mono
$Y lib32-vulkan-dzn lib32-vulkan-gfxstream lib32-vulkan-icd-loader
$Y lib32-vulkan-intel lib32-vulkan-mesa-layers lib32-vulkan-swrast
$Y lib32-vulkan-utility-libraries lib32-vulkan-validation-layers
$Y lib32-vulkan-virtio memtest_vulkan vulkan-dzn vulkan-extra-layers
$Y vulkan-extra-tools vulkan-gfxstream vulkan-headers vulkan-icd-loader
$Y vulkan-intel vulkan-mesa-layers vulkan-swrast vulkan-tools
$Y vulkan-utility-libraries vulkan-validation-layers vulkan-virtio

systemctl enable sddm.service
systemctl enable power-profiles-daemon.service
