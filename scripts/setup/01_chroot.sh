#!/usr/bin/env bash

set -euo pipefail
echo

echo "* REACHED MNT, BE CAREFUL!"
echo

echo "* SETTING UP TIMEZONE"
echo
ln -sfv /usr/share/zoneinfo/Asia/Kolkata /etc/localtime
echo

echo "* SYNCING HARDWARE CLOCK"
echo
hwclock --systohc
echo

echo "* LOCALE SETUP"
echo
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
echo
locale-gen
echo
echo "LANG=en_US.UTF-8" > /etc/locale.conf
echo

echo "* SETTING HOSTNAME"
echo
echo "archy" > /etc/hostname
echo
echo "~ typa password for ROOT :"
echo
passwd
echo

echo "* ADDING A USER"
echo
useradd -m -G wheel archy
echo
echo "~ typa password for USER :"
echo
passwd archy
echo

echo "* ADDING USER TO SUDO"
echo
echo "%wheel ALL=(ALL:ALL) ALL" > /etc/sudoers.d/01_archy
echo

echo "* ENABLING SERVICES"
echo
systemctl enable systemd-timesyncd.service NetworkManager.service fstrim.timer
echo

echo "* CREATING GRUB ENTRIES"
echo
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=LINUXY
echo
grub-mkconfig -o /boot/grub/grub.cfg
echo

echo "* SCRIPT FINISHED"
echo
