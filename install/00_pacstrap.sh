#!/usr/bin/env bash

ERRMSG=">>>> ERROR: invalid response! (try y or n)"

cfdisk /dev/nvme0n1

echo -e "\n>>>> FORMATTING PARTITIONS...\n"
mkfs.fat -F 32 /dev/nvme0n1p1
mkfs.ext4      /dev/nvme0n1p3
mkswap         /dev/nvme0n1p2

echo -e "\n>>>> MOUNTING PARTITIONS...\n"
mount  /dev/nvme0n1p3 /mnt
mount  /dev/nvme0n1p1 /mnt/boot --mkdir
swapon /dev/nvme0n1p2

echo; lsblk; echo

while true; do
  read -p "===> SATISFIED WITH THE PARTITIONS? (y/n) = " sap
  echo; sap="${sap,,}"

  if [[ "$sap" == "y" ]]; then
    clear; echo -e "\n>>>> okay, continuing with script...\n"; break
  elif [[ "$sap" == "n" ]]; then
    echo -e "\n>>>> reboot your shyit and try again!\n"; exit
  else
    clear; echo -e "\n$ERRMSG\n"
  fi
done

while true; do
  echo -e "\n>>>> JUICY PACSTRAP INCOMING...\n"
  if pacstrap -K /mnt base linux-lts linux-firmware fish sudo intel-ucode\
                      networkmanager neovide git keyd\
                      pipewire pipewire-alsa pipewire-audio pipewire-jack\
                      pipewire-libcamera pipewire-pulse sddm; then

    clear; echo -e "\n>>>> SUCCESS: completed PACSTRAP!\n"; break
  else
    echo -e "\n>>>> ERROR: failed to complete PACSTRAP!\n"
    while true; do

      read -p "===> RETRY: retry PACSTRAP? (y/n) = " pas; echo; pas="${pas,,}"

      if [[ "$pas" == "y" ]]; then
        clear; break
      elif [[ "$pas" == "n" ]]; then
        clear; echo -e "\n>>>> ABORT: cancelled PACSTRAP!\n"; break 2
      else
        echo -e "\n$ERRMSG\n"
      fi
    done
  fi
done

echo -e "\n>>>> GENERATING FSTAB...\n"
genfstab -U /mnt > /mnt/etc/fstab

cp -rf 4arch /mnt/root

arch-chroot /mnt /root/4arch/install/01_chroot.sh
