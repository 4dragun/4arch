#!/usr/bin/env bash

cfdisk /dev/nvme0n1

echo
echo " --> formating PARTITIONS now -->"
echo

mkfs.fat -F 32 /dev/nvme0n1p1
echo
mkfs.ext4      /dev/nvme0n1p3
echo
mkswap         /dev/nvme0n1p2

echo
echo " <-- mounting PARTITIONS now <--"
echo

mount  /dev/nvme0n1p3 /mnt
echo
mount  /dev/nvme0n1p1 /mnt/boot --mkdir
echo
swapon /dev/nvme0n1p2

echo
lsblk
echo

read -p " ___executing ARCHINSTALL in next step___"
echo
archinstall
