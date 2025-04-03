#!/usr/bin/env bash
N="sudoedit"
W="wl-copy -n"
Y="yay -S --needed --noconfirm"

nwg-look && kvantummanager

read -p "configure NVCHAD..? " nas
if [[ $nas = y ]]; then
  $W < ~/4arch/scripts/scriptiles/nvhypr.sh
  rm -rf ~/.config/nvim && mkdir ~/.config/nvim
  git clone https://github.com/NvChad/starter ~/.config/nvim
  nvim ~/.config/nvim/init.lua
else
  echo "skipped NVCHAD setup..!"
fi

read -p "sudoedit SYSTEM-files..? " sas
if [[ $sas = y ]]; then
  $W HandlePowerKey=suspend-then-hibernate
  $N /etc/systemd/logind.conf

  $W HibernateDelaySec=1800
  $N /etc/systemd/sleep.conf

  $W resume
  $N /etc/mkinitcpio.conf
else
  echo "skipped SYSTEM-files editing..!"
fi

read -p "configure FISH as interactive shell..? " fas
if [[ $fas = y ]]; then
  $W < ~/4arch/scripts/scriptiles/bafish.sh
  nvim ~/.bashrc
else
  echo "skipped bafish configuration..!"
fi

# read -p "install a GTK-theme..? " gas
# if [[ $gas = y ]]; then
#   git clone https://github.com/Fausto-Korpsvart/Catppuccin-GTK-Theme
#   cd ~/Catppuccin-GTK-Theme/themes
#   ./install.sh -l -c dark --tweaks float macos && cd
# else
#   echo "skipped GTK-theme installation..!"
# fi
# read -p "install a QT-theme..? " qas
# if [[ $qas = y ]]; then
#   git clone https://github.com/catppuccin/Kvantum
#   kvantummanager
# else
#   echo "skipped QT-theme installation..!"
# fi

read -p "regenerate INITRAMFS..? " ias
if [[ $ias = y ]]; then
  sudo mkinitcpio -P
else
  echo "skipped INITRAMFS regeneration..!"
fi

read -p "REBOOTING IN NEXT STEP, CLICK TO CANCEL..."
systemctl reboot
