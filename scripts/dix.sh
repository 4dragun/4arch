#!/usr/bin/env bash

cfdisk /dev/nvme0n1

mkfs.fat -F32 /dev/nvme0n1p1
mkfs.ext4     /dev/nvme0n1p3
mkswap        /dev/nvme0n1p2

mount  /dev/nvme0n1p3 /mnt
mount  /dev/nvme0n1p1 /mnt/boot --mkdir
swapon /dev/nvme0n1p2

lsblk

read -p "executing ARCHINSTALL in next step"
archinstall
