#!/usr/bin/env bash
H2="HandleLidSwitch=suspend-then-hibernate"
H1="HandlePowerKey=suspend-then-hibernate"
Y="yay -S --needed --noconfirm"
W="wl-copy -n"
N="sudoedit"

nwg-look && kvantummanager && qt6ct

read -p "configure FISH as interactive shell..? " fas
if [[ $fas = y ]]; then
  $W < ~/4arch/scripts/scriptiles/bafish.sh
  nvim ~/.bashrc
else
  echo "skipped bafish configuration..!"
fi

read -p "sudoedit SYSTEM-files..? " sas
if [[ $sas = y ]]; then
  echo -e "$H1\n$H2" | $W
  $N /etc/systemd/logind.conf

  $W HibernateDelaySec=1800
  $N /etc/systemd/sleep.conf

  $W resume
  $N /etc/mkinitcpio.conf
else
  echo "skipped SYSTEM-files editing..!"
fi

read -p "regenerate INITRAMFS..? " ias
if [[ $ias = y ]]; then
  sudo mkinitcpio -P
else
  echo "skipped INITRAMFS regeneration..!"
fi

read -p "REBOOTING IN NEXT STEP, CLICK TO CANCEL..."
sync && sync && sync && systemctl reboot
