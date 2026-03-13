#!/usr/bin/env bash

set -euo pipefail

echo -e "\n* REACHED CHROOT SCRIPT, BE CAREFUL!\n"
echo -e "\n* SETTING UP TIMEZONE\n"
ln -sf /usr/share/zoneinfo/Asia/Kolkata /etc/localtime

echo -e "\n* SYNCING HARDWARE CLOCK\n"
hwclock --systohc --verbose

echo -e "\n* LOCALE SETUP\n"
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
echo; locale-gen; echo
echo "LANG=en_US.UTF-8" > /etc/locale.conf

echo -e "\n* SETTING HOSTNAME\n"
echo "archy" > /etc/hostname
echo -e "\n~ typa password for ROOT :\n"
passwd

echo -e "\n* ADDING A USER\n"
id -u archy &>/dev/null || useradd -m -G wheel archy
echo -e "\n~ typa password for USER :\n"
passwd archy

echo -e "\n* ADDING USER TO SUDO\n"
echo "%wheel ALL=(ALL:ALL) ALL" > /etc/sudoers.d/01_archy
echo "Defaults pwfeedback, insults" >> /etc/sudoers.d/01_archy

echo -e "\n FIXING SOME HARDWARE KEYBOARD KEYS\n"
mkdir -pv /etc/keyd; echo
cat <<EOF > /etc/keyd/default.conf
[ids]
*

[main]
f8       = a
f9       = q
grave    = tab
capslock = esc

[shift]
grave    = ~
capslock = capslock

f1 = mute
f2 = volumedown
f3 = volumeup

f4 = brightnessdown
f5 = brightnessup
EOF

echo -e "\n* ENABLING SERVICES\n"
systemctl enable systemd-timesyncd.service NetworkManager.service fstrim.timer\
                 keyd.service sddm.service

# echo -e "\n* CREATING GRUB ENTRIES\n"
# grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=LINUXY
# echo; grub-mkconfig -o /boot/grub/grub.cfg

echo -e "\n* SETTING UP SYSTEMD-BOOT\n"
bootctl install

# Automatically grab the UUID of your root partition (/dev/nvme0n1p3)
ROOT_UUID=$(findmnt -n -o UUID /)

# 1. Main loader configuration
cat <<EOF > /boot/loader/loader.conf
default      arch-lts.conf
timeout      9
console-mode auto
editor       no
EOF

# 2. The LTS Boot Entry
cat <<EOF > /boot/loader/entries/arch-lts.conf
title   Arch Linux - LTS
linux   /vmlinuz-linux-lts
initrd  /intel-ucode.img
initrd  /initramfs-linux-lts.img
options root=UUID=$ROOT_UUID rw
EOF

echo -e "\n*EXP. RUNNING PACMAN-KEY\n"
PK="pacman-key"
PU="pacman -U --needed --noconfirm"

$PK --init; echo
$PK --populate archlinux; echo

echo -e "\n* EXP. CHAOTIC STUFF GOIN ON"
C1="https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst"
C2="https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst"

$PK --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com; echo
$PK --lsign-key 3056513887B78AEB; echo
$PU "$C1"; echo
$PU "$C2"; echo

echo -e "\n* CREATING PACMAN DROP-INS (ZERO TOUCH METHOD)\n"

# 1. Create the directory (it usually doesn't exist by default)
mkdir -p /etc/pacman.d/conf.d

# 2. Create your custom settings file
# This handles the options and the repos without touching pacman.conf
cat <<EOF > /etc/pacman.d/conf.d/archy-custom.conf
[options]
Color
ILoveCandy
VerbosePkgLists

[multilib]
Include = /etc/pacman.d/mirrorlist

[chaotic-aur]
Include = /etc/pacman.d/chaotic-mirrorlist
EOF

# 3. Only ONE change to the main file: tell it to look at your new folder
# We just append this to the very end
echo 'Include = /etc/pacman.d/conf.d/*.conf' >> /etc/pacman.conf

echo -e "\n* SCRIPT FINISHED\n"
