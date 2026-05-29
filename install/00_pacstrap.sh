#!/usr/bin/env bash

ERRMSG=">>>> ERROR: invalid response! (try y or n)"

clear; echo -e "\n>>>> WELCOME...\n"; sleep 3

echo -e "\n>>>> CHECKING IF DISK IS READY FOR PARTITIONING...\n"; sleep 3

if mountpoint /mnt; then
  clear
  echo -e "\n>>>> SKIP: /mnt is already mounted! skipping FORMATTING...\n"
else
  while true; do

  read -p "===> PARTITION & FORMAT DISK AS REQUIRED? (y/n) = " pfa
  echo; pfa="${pfa,,}"

    if [[ "$pfa" == "y" ]]; then
      cfdisk /dev/nvme0n1

      echo -e "\n>>>> FORMATTING PARTITIONS (BTRFS ARCH WIKI METHOD)...\n"
      # Format isolated 2GB UEFI boot room
      mkfs.fat -F 32 /dev/nvme0n1p5
      
      # Target p6 as your primary 98GB Btrfs workspace pool
      mkfs.btrfs -L ARCH_VAULT -f /dev/nvme0n1p6

      echo -e "\n>>>> CREATING BTRFS SUBVOLUMES (THE DIVIDERS)...\n"
      # Mount your new p6 partition temporarily to lay down namespaces
      mount /dev/nvme0n1p6 /mnt
      btrfs subvolume create /mnt/@
      btrfs subvolume create /mnt/@home
      umount /mnt

      echo -e "\n>>>> MOUNTING COMPRESSED SUBVOLUMES...\n"
      # Mount Root subvolume from p6 with active transparent zstd compression
      mount -o noatime,compress=zstd:3,subvol=@ /dev/nvme0n1p6 /mnt
      
      # Build inner structural closets
      mkdir -p /mnt/home /mnt/boot

      # Mount Home subvolume from p6 and isolated Boot partition from p5
      mount -o noatime,compress=zstd:3,subvol=@home /dev/nvme0n1p6 /mnt/home
      mount /dev/nvme0n1p5 /mnt/boot
      clear; break
    elif [[ "$pfa" == "n" ]]; then
      clear; echo -e "\n>>>> ERROR: DISK is not ready for installation!\n"
      exit
    else
      clear; echo -e "\n$ERRMSG\n"
    fi
  done
fi

echo -e "\n>>>> CURRENT PARTITION TABLE OVERVIEW: \n"
echo; lsblk; echo

while true; do
  read -p "===> SATISFIED WITH THE PARTITIONS? (y/n) = " sap
  echo; sap="${sap,,}"

  if [[ "$sap" == "y" ]]; then
    clear; echo -e "\n>>>> SUCCESS: continuing with SCRIPT...\n"; break
  elif [[ "$sap" == "n" ]]; then
    echo -e "\n>>>> REBOOT your SHYIT and try again!\n"; exit
  else
    clear; echo -e "\n$ERRMSG\n"
  fi
done

while true; do
  echo -e "\n>>>> JUICY PACSTRAP INCOMING...\n"
  if pacstrap -K /mnt base linux linux-firmware; then

    clear; echo -e "\n>>>> SUCCESS: completed PACSTRAP!\n"; break
  else
    echo -e "\n>>>> ERROR: failed to complete PACSTRAP!\n"
    while true; do

      read -p "===> RETRY: retry PACSTRAP? (y/n) = " pas; echo; pas="${pas,,}"

      if [[ "$pas" == "y" ]]; then
        clear; break
      elif [[ "$pas" == "n" ]]; then
        clear; echo -e "\n>>>> ABORT: cancelled PACSTRAP! Exited!\n"; exit
      else
        clear; echo -e "\n$ERRMSG\n"
      fi
    done
  fi
done

echo -e "\n>>>> GENERATING FSTAB...\n"
genfstab -U /mnt > /mnt/etc/fstab

# Copying to the root layout path to ensure clean chroot absolute path execution
cp -rf 4arch /mnt/

arch-chroot /mnt /4arch/install/01_chroot.sh

while true; do
  read -p "===> 00_SCRIPT ENDED, REBOOT NOW? (y/n) = " csas
  echo; csas="${csas,,}"

  if [[ "$csas" == "y" ]]; then
    
    clear; echo -e "\n>>>> CLEANING OUT INSTALLATION ASSETS FROM DISK...\n"
    rm -rf /mnt/4arch
    
    echo -e "\n>>>> UNMOUNTING PARTITIONS nd shyit...\n"
    umount -R /mnt
    
    echo -e "\n>>>> REBOOT INITIATED...\n"
    sleep 3; sync; sync; sync; systemctl reboot
  
  elif [[ "$csas" == "n" ]]; then
    clear; echo -e "\n>>>> OKAY, REBOOT MANUALLY!\n"; exit
  else
    clear; echo -e "\n$ERRMSG\n"
  fi
done
