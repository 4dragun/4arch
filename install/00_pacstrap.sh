#!/usr/bin/env bash

set -euo pipefail

cfdisk /dev/nvme0n1

echo -e "\n* FORMATTING PARTITIONS\n"
mkfs.fat -F 32 /dev/nvme0n1p1
mkfs.ext4      /dev/nvme0n1p3
mkswap         /dev/nvme0n1p2

echo -e "\n* MOUNTING PARTITIONS\n"
mount  /dev/nvme0n1p3 /mnt
mount  /dev/nvme0n1p1 /mnt/boot --mkdir
swapon /dev/nvme0n1p2

echo; lsblk; echo

while true; do
  read -p "? SATISFIED WITH PARTITIONS (y/n) = " sap
  echo
  sap="${sap,,}"

  if [[ "$sap" == "y" ]]; then
    echo -e "\n~ okay, continuing with script\n"; break
  elif [[ "$sap" == "n" ]]; then
    echo -e "\n~ reboot your shyit and try again!\n"; exit
  else
    echo -e "\n~ invalid response, try again!\n"
  fi
done

echo -e "\n* JUICY PACSTRAP INCOMING\n"
pacstrap -K /mnt base linux linux-firmware fish sudo intel-ucode\
                 networkmanager neovide git grub efibootmgr keyd\
                 pipewire pipewire-alsa pipewire-audio pipewire-jack\
                 pipewire-libcamera pipewire-pulse

echo -e "\n* GENERATING FSTAB\n"
genfstab -U /mnt > /mnt/etc/fstab

cp -rf 4arch /mnt/root

arch-chroot /mnt /root/4arch/scripts/install/01_chroot.sh
