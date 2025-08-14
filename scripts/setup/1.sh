#!/usr/bin/env bash

YU="yay -U --needed --noconfirm"
YS="yay -S --needed --noconfirm"

ZSF="$HOME/.config/ZORIGINAL_SYSTEM_FILES"

WALL="$HOME/4arch/walls/wallhaven-7jgyre_1920x1080.png"

echo
echo "* WELCOME TO 4ARCH SCRIPT"
echo
echo "* RUNNING PACMAN-KEY"
echo
sudo pacman-key --init
echo
sudo pacman-key --populate archlinux
echo
read -p "? CONFIGURE LOCAL DOTFILES, ICONS, THEMES (y/N) = " itd
echo
read -p "? INSTALL YAY - Yet Another AUR Helper (y/N) = " yas
echo
read -p "? ADD CHAOTIC-AUR REPO (y/N) = " cas
echo

if [[ "$itd" = y ]]; then
  rm -rf ~/.config/nvim
  rm -rf ~/.local/state/nvim
  rm -rf ~/.local/share/nvim
  echo
  echo "> CLONING NVCHAD"
  echo
  git clone https://github.com/NvChad/starter ~/.config/nvim
  echo
  cp -r ~/4arch/confs/. ~/.config
  mv ~/.config/.gitconfig ~/
  echo
else
  echo "~ SKIPPED DOTFILES, ICONS, THEMES SETUP"
  echo
fi

if [[ "$yas" = y ]]; then
  sudo pacman -S --needed --noconfirm git base-devel
  echo
  echo "> CLONING YAY"
  echo
  rm -rf ~/yay-bin
  echo
  git clone https://aur.archlinux.org/yay-bin.git
  echo
  cd yay-bin && makepkg -si --noconfirm && cd && yay --noconfirm
  echo
else
  echo "~ SKIPPED YAY SETUP"
  echo
fi

if [[ "$cas" = y ]]; then
  echo "* ADDING CHAOTIC-AUR REPO"
  echo
  sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
  echo
  sudo pacman-key --lsign-key 3056513887B78AEB
  echo
  $YU 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'
  echo
  $YU 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
  echo
else
  echo "~ SKIPPED CHAOTIC-AUR SETUP"
  echo
fi

read -p "? CHAOTIC-AUR SETUP SUCCEEDED (Y/n) = " chas
echo
if [[ "$chas" = n ]]; then
  read -p "? REBOOT now (y/N) = " ras
  echo
  if [[ "$ras" = y ]]; then
    sleep 1
    sync && sync && sync && systemctl reboot
  else
    echo "~ REBOOT MANUALLY!"
    echo
    exit
  fi
else
  echo "~ ASSUMING CHAOTIC-AUR SETUP WAS SUCCESSFUL"
  echo
fi

read -p "? BACKUP SYSTEM_FILES (y/N) = " cop
echo
if [[ "$cop" = y ]]; then
  read -p "? NOW ENTER KEY: " kas
  echo
  if [[ "$kas" = archydoes ]]; then
    if [[ -d "$ZSF" ]]; then
      echo "~ BACKUP FOLDER ALREADY EXISTS! SKIPPING BACKUP!"
      echo
    else
      echo "* CREATING ZORIGINAL_SYSTEM_FILES FOLDER"
      echo
      sudo mkdir -p "$ZSF"
      echo
      echo "* BACKUP INCOMING"
      echo
      sudo cp -r /etc/systemd/logind.conf "$ZSF"
      sudo cp -r /etc/systemd/sleep.conf  "$ZSF"
      sudo cp -r /etc/mkinitcpio.conf     "$ZSF"
      sudo cp -r /etc/pacman.conf         "$ZSF"
      echo
      echo "* SECURING THE BACKUP"
      echo
      sudo chattr +i "$ZSF"
      echo
      echo "~ SYSTEM_FILES BACKUP COMPLETE!"
      echo
    fi
  else
    echo "~ WRONG KEY DUDE :("
    echo
    exit
  fi
else
  echo "~ SKIPPED SYSTEM_FILES BACKUP!"
  echo
fi

read -p "? REPLACE SYSTEM_FILES WITH CUSTOM ONES (y/N) = " sas
echo
if [[ "$sas" = y ]]; then
  if [[ -d "$ZSF" ]]; then
    echo "~ BACKUP FOLDER FOUND!"
    echo
    echo "~ PROCEEDING"
    echo
    sudo cp -r ~/4arch/confs_system/. /etc
    echo
  else
    echo "~ BACKUP FOLDER NOT FOUND!"
    echo
    echo "~ CANNOT PROCEED!"
    echo
    exit
  fi
else
  echo "~ SKIPPED REPLACING SYSTEM_FILES WITH CUSTOM ONES"
  echo
fi

read -p "? RUN MKINITCPIO (y/N) = " mas
echo
if [[ "$mas" = y ]]; then
  echo "* RUNNING MKINITCPIO"
  echo
  sudo mkinitcpio -P
  echo
else
  echo "~ SKIPPED MKINITCPIO"
  echo
fi

echo "* UPDATING SYSTEM WITH YAY"
echo
yay --noconfirm
echo
echo "* INSTALLING AUR PACKAGES"
echo
$YS clipse-bin matugen-bin
echo
echo "* INSTALLING INTERNAL DEPENDENCIES"
echo
$YS bibata-cursor-theme adw-gtk-theme darkly-qt6-git \
    papirus-icon-theme papirus-folders \
    lua-language-server
echo
echo "* INSTALLING FONTS"
echo
$YS noto-fonts noto-fonts-cjk noto-fonts-extra noto-fonts-emoji \
    ttf-jetbrains-mono-nerd
echo
echo "* INSTALLING HYPRLAND AND ITS DEPENDENCIES"
echo
$YS hyprland xdg-desktop-portal-hyprland xdg-desktop-portal-kde grimblast \
    qt5-wayland hypridle hyprlock hyprpicker hyprpolkitagent hyprpaper
echo
echo "* INSTALLING GUI APPLICATIONS"
echo
$YS sddm brave emote pavucontrol telegram-desktop mpv gwenview rofi-wayland \
    firefox nwg-look blueman qbittorrent swaync reflector-simple neovide \
    waybar network-manager-applet dolphin ark swappy systemsettings kdialog
echo
echo "* INSTALLING CLI APPLICATIONS"
echo
$YS fzf lsd bat pacseek fastfetch btop udiskie kitty aria2 yazi starship \
    git-credential-manager-bin wl-clipboard brightnessctl xdg-user-dirs \
    power-profiles-daemon
echo
echo "~ FINISHED INSTALLING APPLICATIONS"
echo

echo "* CREATING XDG DIRECTORIES"
echo
xdg-user-dirs-update
echo
mkdir -p "$HOME/Pictures/Screenshots"
echo

echo "* BUILDING THEMES WITH MATUGEN"
echo
matugen image "$WALL"
echo
echo "$WALL" > "$HOME/.cache/last_wall.txt"
echo
echo "* SETTING FOLDER THEME"
echo
papirus-folders -C violet
echo

echo "* ENABLING SERVICES"
sudo systemctl enable power-profiles-daemon \
                      sddm

sudo systemctl --user enable pipewire-pulse.service \
                             wireplumber.service
echo

echo "* REMOVING 4ARCH REPO FROM ROOT DIRECTORY"
echo
sudo rm -rf /root/4arch
echo

read -p "? 4ARCH SCRIPT ENDED, REBOOT NOW (y/N) = " nas
echo
if [[ "$nas" = y ]]; then
  sleep 1
  sync && sync && sync && systemctl reboot
else
  echo "~ OKAY, REBOOT MANUALLY!"
  echo
  exit
fi
