#!/usr/bin/env bash

set -euo pipefail; echo

cfdisk /dev/nvme0n1

echo -e "\n ... FORMATTING PARTITIONS ...\n"
mkfs.fat -F 32 /dev/nvme0n1p1; echo
mkfs.ext4      /dev/nvme0n1p3; echo
mkswap         /dev/nvme0n1p2

echo -e "\n ... MOUNTING PARTITIONS ...\n"
mount  /dev/nvme0n1p3 /mnt; echo
mount  /dev/nvme0n1p1 /mnt/boot --mkdir; echo
swapon /dev/nvme0n1p2; echo

lsblk; echo

read -p " >>> SATISFIED WITH PARTITIONS ? (y/n) = " sap

if [[ "$sap" = y ]]; then
  echo -e "\n --- okay, continuing with script ---\n"
else
  echo -e "\n --- reboot your shyit and try again! ---\n"
  exit
fi

echo -e " ... JUICY PACSTRAP INCOMING ...\n"
pacstrap -K /mnt base linux linux-firmware fish sudo intel-ucode \
                 networkmanager neovide git grub efibootmgr \
                 pipewire pipewire-alsa pipewire-audio pipewire-jack \
                 pipewire-libcamera pipewire-pulse

echo -e "\n ... GENERATING FSTAB ...\n"
genfstab -U /mnt >> /mnt/etc/fstab

echo -e "\n ~~~ CLONING YOUR REPOSITORY ~~~\n"
git clone https://github.com/4dragun/4arch --depth=1; echo

cp -r 4arch /mnt/root || { exit; }; echo

arch-chroot /mnt /root/4arch/scripts/BWIPMNT.sh
