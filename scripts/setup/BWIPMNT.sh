#!/usr/bin/env bash

set -euo pipefail; echo

echo -e " ... REACHED MNT, BE CAREFUL ...\n"

echo -e " ... SETTING UP TIMEZONE ...\n"
ln -sf /usr/share/zoneinfo/Asia/Kolkata /etc/localtime

echo -e "\n ... HARDWARE CLOCK SOMETHIN ...\n"
hwclock --systohc

echo -e "\n ... LOCALE STUFF ...\n"

echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen; echo

locale-gen; echo

echo "LANG=en_US.UTF-8" > /etc/locale.conf

echo -e "\n ... WRITIN HOSTNAME ...\n"

echo "archy" > /etc/hostname

echo -e "\n --- typa password for ROOT :\n"
passwd

echo -e "\n ... ADDING A USER ...\n"
useradd -m -G wheel archy

echo -e "\n --- typa password for USER :\n"
passwd archy

echo -e "\n ... SUDO STUFF GOIN ON ...\n"

echo "%wheel ALL=(ALL:ALL) ALL" > /etc/sudoers.d/01_testi

echo -e "\n ... ENABLING SERVICES ...\n"
systemctl enable NetworkManager.service \
                 fstrim.timer
echo
sudo -u archy systemctl --user enable pipewire-pulse.service \
                                      wireplumber.service

echo -e "\n ... GRUB STUFF REACHED BTW ...\n"
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
echo
grub-mkconfig -o /boot/grub/grub.cfg

echo -e "\n ... SCRIPT FINISHED ...\n"
