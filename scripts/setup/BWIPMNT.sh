#!/usr/bin/env bash

echo
echo " ... Reached MNT byitch shyits, be careful..!"
echo

echo " ___ Setting up timeZONE ___"
echo
ln -sf /usr/share/zoneinfo/Asia/Kolkata /etc/localtime
echo

echo " ___ Hardware clock somethin___"
echo
hwclock --systohc
echo

echo " ___ Locale stuff ___"
echo
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
echo
locale-gen
echo
echo "LANG=en_US.UTF-8" > /etc/locale.conf
echo

echo " ___ Writin HOSTNAME ___"
echo "archy" > /etc/hostname
echo
echo " -> typa password for ROOT :"
echo
passwd
echo

echo " ___ adding a USER ___"
echo
useradd -m -G wheel archy
echo
echo " -> typa password for the USER :"
echo
passwd archy
echo

echo " ___ SUDO stuff goin on ___"
echo
echo "%wheel ALL=(ALL:ALL) ALL" > /etc/sudoers.d/01_testi
echo

echo " ___ Enabling SERVICES ___"
echo
systemctl enable NetworkManager.service \
                 fstrim.timer
echo
sudo -u archy systemctl --user enable pipewire-pulse.service \
                                      wireplumber.service
echo

echo " ___ GRUB stuff reached btw ___"
echo
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
echo
grub-mkconfig -o /boot/grub/grub.cfg
echo

echo " ... SCRIPT FINISHED ..."
