#!/usr/bin/env bash

ERRMSG=">>>> ERROR: invalid response! (try y or n)"

echo -e "\n>>>> REACHED CHROOT SCRIPT, BE CAREFUL!\n"

#EXPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPP
# Download and extract the installer
curl -O https://mirror.cachyos.org/cachyos-repo.tar.xz
tar xvf cachyos-repo.tar.xz && cd cachyos-repo
# Run the automated installer
sudo ./cachyos-repo.sh
pacman -Syu

pacman -S --needed linux-cachyos-bore btrfs-progs fish sudo\
                   intel-ucode networkmanager neovide git base-devel keyd\
                   unzip pipewire pipewire-alsa pipewire-audio\
                   pipewire-jack pipewire-libcamera pipewire-pulse sddm\
                   archlinux-xdg-menu veracrypt exfatprogs

echo -e "\n>>>> CREATING SECURE ENCRYPTED BTRFS SWAPFILE...\n"
btrfs filesystem mkswapfile --size 16g /swapfile
swapon /swapfile

echo -e "\n>>>> SETTING UP TIMEZONE...\n"
ln -sf /usr/share/zoneinfo/Asia/Kolkata /etc/localtime

echo -e "\n>>>> SYNCING HARDWARE CLOCK...\n"
hwclock --systohc --verbose

echo -e "\n>>>> LOCALE SETUP...\n"

grep -qxF "en_US.UTF-8 UTF-8" /etc/locale.gen ||\
  echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen

echo; locale-gen; echo
echo "LANG=en_US.UTF-8" > /etc/locale.conf

echo -e "\n>>>> SETTING HOSTNAME...\n"
echo "archy-pc" > /etc/hostname

while true; do
  echo -e "\n===> SET A PASSWORD FOR ROOT :\n"

  if passwd; then
    clear; echo -e "\n>>>> SUCCESS: password set for ROOT!\n"; break
  else
    echo -e "\n>>>> ERROR: failed to set PASSWORD for ROOT!\n"

    while true; do
      read -p "===> RETRY: retry setting password for ROOT? (y/n) = " rpr
      echo; rpr="${rpr,,}"

      if [[ "$rpr" == "y" ]]; then
        break
      elif [[ "$rpr" == "n" ]]; then
        clear; echo -e "\n>>>> ABORT: password not set for ROOT!\n"; break 2
      else
        clear; echo -e "\n$ERRMSG\n"
      fi
    done
  fi
done

echo -e "\n>>>> ADDING USER - ARCHY...\n"
id -u archy &>/dev/null || useradd -m -G wheel archy

while true; do
  echo -e "\n>>>> SET A PASSWORD FOR USER - ARCHY :\n"

  if passwd archy; then
    clear; echo -e ">>>> SUCCESS: password set for ARCHY!"; break
  else
    echo -e "\n>>>> ERROR: failed to set PASSWORD for ARCHY!\n"

    while true; do
      read -p "===> RETRY: retry setting password for ARCHY? (y/n) = " rar
      echo; rar="${rar,,}"

      if [[ "$rar" == "y" ]]; then
        break
      elif [[ "$rar" == "n" ]]; then
        clear; echo -e "\n>>>> ABORT: password not set for ARCHY!\n"; break 2
      else
        clear; echo -e "\n$ERRMSG\n"
      fi
    done
  fi
done

echo -e "\n>>>> ADDING USERS TO SUDO...\n"
echo "%wheel ALL=(ALL:ALL) ALL" > /etc/sudoers.d/01_archy
echo "Defaults pwfeedback, insults" >> /etc/sudoers.d/01_archy
# EXPERIMENTAL CRYPTION >>>
echo "archy ALL = (root) NOPASSWD:/usr/bin/veracrypt, /usr/bin/true" >> /etc/sudoers.d/01_archy
# EXPERIMENTAL CRYPTYYY >>>
echo "options loop max_loop=8" | sudo tee /etc/modprobe.d/loop_devices.conf

echo -e "\n>>>> ENABLING SERVICES...\n"
systemctl enable systemd-timesyncd.service NetworkManager.service fstrim.timer\
                 keyd.service

echo -e "\n>>>> SETTING UP SYSTEMD-BOOT...\n"
bootctl install || bootctl update
# Automatically grab the UUID of your root partition (/dev/nvme0n1p3)
ROOT_UUID=$(findmnt -n -o UUID /)
# 1. Main loader configuration
cat <<EOF > /boot/loader/loader.conf
default      linux-cachyos-bore.conf
timeout      9
console-mode auto
editor       no
EOF
# 2. The LTS Boot Entry
cat <<EOF > /boot/loader/entries/linux.conf
title   LINUX CACHYOS BORE
linux   /vmlinuz-linux-cachyos-bore
initrd  /intel-ucode.img
initrd  /initramfs-linux-cachyos-bore.img
options root=UUID=$ROOT_UUID rootflags=subvol=@ rw
EOF

echo -e "\n>>>> FIXING SOME HARDWARE KEYBOARD KEYS...\n"
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

echo -e "\n>>>> CONFIGURING SDDM...\n"
rm -rf /etc/sddm.conf; echo
mkdir -pv /etc/sddm.conf.d; echo
cat <<EOF > /etc/sddm.conf.d/archy-sddm.conf
[General]
DisplayServer=wayland
Numlock=on

[Theme]
Current=pixie
EOF

echo -e "\n>>>> GIVING SYSTEMD-FILES DROP-INS...\n"
mkdir -p /etc/systemd/logind.conf.d /etc/systemd/sleep.conf.d
cat <<EOF > /etc/systemd/logind.conf.d/archy-logind.conf
[Login]
HandlePowerKey=suspend-then-hibernate
HandleLidSwitch=suspend-then-hibernate
EOF
cat <<EOF > /etc/systemd/sleep.conf.d/archy-sleep.conf
[Sleep]
HibernateDelaySec=1800
EOF

echo -e "\n>>>> GIVING HIBERNATION HOOKS (SAFE ORDER)\n"
mkdir -p /etc/mkinitcpio.conf.d
cat <<EOF > /etc/mkinitcpio.conf.d/archy-resume.conf
HOOKS=(base systemd autodetect microcode modconf kms keyboard keymap sd-vconsole block filesystems resume fsck)
EOF

while true; do
  if mkinitcpio -P; then
    clear; echo -e "\n>>>> SUCCESS: completed MKINITCPIO!\n"; break
  else
    echo -e "\n>>>> ERROR: errors occured while running MKINITCPIO!\n"

    while true; do
      read -p "===> RETRY: wanna run MKINITCPIO again? (y/n) = " was
      echo; was="${was,,}"

      if [[ "$was" == "y" ]]; then
        clear; break
      elif [[ "$was" == "n" ]]; then
        clear; echo -e "\n>>>> ABORT: cancelled MKINITCPIO re-run!\n"; break 2
      else
        clear; echo -e "\n$ERRMSG\n"
      fi
    done
  fi
done

while true; do
  echo -e "\n>>>> RUNNING PACMAN-KEY...\n"

  if pacman-key --init && echo && pacman-key --populate archlinux && echo; then
    clear; echo -e "\n>>>> SUCCESS: completed PACMAN-KEY!\n"; break
  else
    echo -e "\n>>>> ERROR: errors occured in PACMAN-KEY!\n"

    while true; do
      read -p "===> RETRY: retry PACMAN-KEY? (y/n) = " kas
      echo; kas="${kas,,}"

      if [[ "$kas" == "y" ]]; then
        clear; break
      elif [[ "$kas" == "n" ]]; then
        clear; echo -e "\n>>>> ABORT: cancelled PACMAN-KEY!\n"; break 2
      else
        clear; echo -e "\n$ERRMSG\n"
      fi
    done
  fi
done

while true; do
  C1="https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst"
  C2="https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst"

  echo -e "\n>>>> ADDING CHAOTIC-AUR STUFF...\n"

  if
    pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com &&\
    echo &&\
    pacman-key --lsign-key 3056513887B78AEB &&\
    echo &&\
    pacman -U --needed --noconfirm "$C1" && echo &&\
    pacman -U --needed --noconfirm "$C2" && echo; then

     clear; echo -e "\n>>>> SUCCESS: configured CHAOTIC-AUR!\n"; break
  else
    echo -e "\n>>>> ERROR: failed to configure CHAOTIC-AUR!\n"

    while true; do
      read -p "===> RETRY: retry configuring CHAOTIC-AUR? (y/n) = " chos
      echo; chos="${chos,,}"

      if [[ "$chos" == "y" ]]; then
        clear; break
      elif [[ "$chos" == "n" ]]; then
        clear; echo -e "\n>>>> ABORT: cancelled CHAOTIC-AUR setup!\n"; break 2
      else
        clear; echo -e "\n$ERRMSG\n"
      fi
    done
  fi
done

echo -e "\n>>>> CREATING PACMAN DROP-INS (ZERO TOUCH METHOD)...\n"
# 1. Create the directory (it usually doesn't exist by default)
mkdir -p /etc/pacman.d/hooks
# 2. Create your custom settings file
cat <<EOF > /etc/pacman.d/archy-custom.conf
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
grep -qxF 'Include = /etc/pacman.d/*.conf' /etc/pacman.conf ||\
  echo 'Include = /etc/pacman.d/*.conf' >> /etc/pacman.conf

# 4. OPTIONAL KDEcache FIX HOOK
cat <<EOF > /etc/pacman.d/hooks/updateKDEcache.hook
[Trigger]
Operation = Install
Operation = Upgrade
Operation = Remove
Type = Path
Target = usr/share/applications/*.desktop

[Action]
Description = Updating the Kservice desktop file configuration cache...
When = PostTransaction
Exec = /bin/bash -c "sudo -u \"$(logname)\" bash -lc 'XDG_MENU_PREFIX=arch- /usr/bin/kbuildsycoca6 --noincremental'"
Depends = sudo
Depends = coreutils
Depends = kservice
Depends = archlinux-xdg-menu
EOF

while true; do
  clear; echo -e "\n>>>> TESTING PACMAN-UPDATE...\n"

  if pacman -Syu --needed --noconfirm; then
    clear; echo -e "\n>>>> SUCCESS: PACMAN is now fully functional!\n"
    break
  else
    echo -e "\n>>>> ERROR: PACMAN failed!\n"
   
    while true; do
      read -p "===> RETRY: retry running PACMAN? (y/n) = " paca
      echo; paca="${paca,,}"

      if [[ "$paca" == "y" ]]; then
        clear; break
      elif [[ "$paca" == "n" ]]; then
        clear; echo -e "\n>>>> ABORT: cancelled PACMAN-UPDATE!\n"; break 2
      else
        clear; echo -e "\n$ERRMSG\n"
      fi
    done
  fi
done

clear; echo -e "\n>>>> CHROOT-SCRIPT ENDED, RETURNING TO MAIN SCRIPT...\n"
sleep 3; exit
