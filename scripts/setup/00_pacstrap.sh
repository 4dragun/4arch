#!/usr/bin/env bash

set -euo pipefail; echo

cfdisk /dev/nvme0n1

echo
echo "* FORMATTING PARTITIONS"
echo

mkfs.fat -F 32 /dev/nvme0n1p1
echo
mkfs.ext4      /dev/nvme0n1p3
echo
mkswap         /dev/nvme0n1p2

echo
echo "* MOUNTING PARTITIONS"
echo

mount  /dev/nvme0n1p3 /mnt
echo
mount  /dev/nvme0n1p1 /mnt/boot --mkdir
echo
swapon /dev/nvme0n1p2

echo; lsblk; echo

while true; do
  read -p "? SATISFIED WITH PARTITIONS (y/n) = " sap
  echo
  sap="${sap,,}"

  if [[ "$sap" == "y" ]]; then
    echo "~ okay, continuing with script"
    echo
    break
  elif [[ "$sap" == "n" ]]; then
    echo "~ reboot your shyit and try again!"
    echo
    exit
  else
    echo "~ invalid response, try again!"
    echo
  fi
done

echo
echo "* JUICY PACSTRAP INCOMING"
echo
pacstrap -K /mnt base linux linux-firmware fish sudo intel-ucode \
                 networkmanager neovide git grub efibootmgr \
                 pipewire pipewire-alsa pipewire-audio pipewire-jack \
                 pipewire-libcamera pipewire-pulse

echo
echo "* GENERATING FSTAB"
echo
genfstab -U /mnt >> /mnt/etc/fstab || { exit; }

echo
echo "> CLONING 4ARCH REPO"
echo
git clone https://github.com/4dragun/4arch --depth=1

echo
cp -rv 4arch /mnt/root || { exit; }
echo

arch-chroot /mnt /root/4arch/scripts/setup/01_chroot.sh
