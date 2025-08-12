#!/usr/bin/env bash

cfdisk /dev/nvme0n1

echo
echo " -> formatting PARTITIONS now ->"
echo

mkfs.fat -F 32 /dev/nvme0n1p1
echo
mkfs.ext4      /dev/nvme0n1p3
echo
mkswap         /dev/nvme0n1p2

echo
echo " <- mounting PARTITIONS now <-"
echo

mount  /dev/nvme0n1p3 /mnt
echo
mount  /dev/nvme0n1p1 /mnt/boot --mkdir
echo
swapon /dev/nvme0n1p2

echo
lsblk
echo

read -p " -> SATISFIED with PARTITIONS ? (y/n) = " sap
echo

if [[ "$sap" = y ]]; then
  echo
  echo " ___ Okay, continuing with script ___"
  echo
else
  echo
  echo " ___ Reboot your shyit and try again ___"
  echo
  exit
fi

echo " ... Juicy PACSTRAP incoming ..."
echo
pacstrap -K /mnt base linux linux-firmware fish sudo intel-ucode \
                 networkmanager neovide git grub efibootmgr \
                 pipewire pipewire-alsa pipewire-audio pipewire-jack \
                 pipewire-libcamera pipewire-pulse lib32-pipewire
echo

echo " ... Generating fstab now ..."
echo
genfstab -U /mnt >> /mnt/etc/fstab
echo

echo " === Cloning your reposi ==="
echo
git clone https://github.com/4dragun/4arch --depth=1
echo

cp -r 4arch /mnt/root

arch-chroot /mnt /root/4arch/scripts/BWIPMNT.sh
