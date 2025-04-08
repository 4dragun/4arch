#!/usr/bin/env bash
Y="yay -S --needed --noconfirm"

$Y lutris goverlay lib32-mangohud wine-mono lib32-pipewire
$Y lib32-vulkan-dzn lib32-vulkan-gfxstream lib32-vulkan-icd-loader
$Y lib32-vulkan-intel lib32-vulkan-mesa-layers lib32-vulkan-swrast
$Y lib32-vulkan-utility-libraries lib32-vulkan-validation-layers
$Y lib32-vulkan-virtio memtest_vulkan vulkan-dzn vulkan-extra-layers
$Y vulkan-extra-tools vulkan-gfxstream vulkan-headers vulkan-icd-loader
$Y vulkan-intel vulkan-mesa-layers vulkan-swrast vulkan-tools
$Y vulkan-utility-libraries vulkan-validation-layers vulkan-virtio
$Y linux-lqx update-grub grub-customizer xorg-xhost

sudo update-grub
grub-customizer

read -p "REBOOTING IN NEXT STEP, CLICK TO CANCEL..."
sync && sync && sync && systemctl reboot
