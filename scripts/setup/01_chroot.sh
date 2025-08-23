#!/usr/bin/env bash

set -euo pipefail; echo

echo -e "* REACHED MNT, BE CAREFUL!\n"

echo -e "* SETTING UP TIMEZONE\n"
ln -sfv /usr/share/zoneinfo/Asia/Kolkata /etc/localtime

echo -e "* SYNCING HARDWARE CLOCK\n"
hwclock --systohc --verbose

echo -e "\n* LOCALE SETUP\n"
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
echo; locale-gen; echo
echo "LANG=en_US.UTF-8" > /etc/locale.conf

echo -e "\n* SETTING HOSTNAME\n"
echo "archy" > /etc/hostname
echo -e "~ typa password for ROOT :\n"
passwd

echo -e "\n* ADDING A USER\n"
useradd -m -G wheel archy
echo -e "\n~ typa password for USER :\n"
passwd archy

echo -e "\n* ADDING USER TO SUDO\n"
echo "%wheel ALL=(ALL:ALL) ALL" > /etc/sudoers.d/01_archy

echo -e "\n* ENABLING SERVICES\n"
systemctl enable systemd-timesyncd.service NetworkManager.service fstrim.timer

echo -e "\n* CREATING GRUB ENTRIES\n"
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=LINUXY
echo; grub-mkconfig -o /boot/grub/grub.cfg

echo -e "\n* SCRIPT FINISHED\n"
