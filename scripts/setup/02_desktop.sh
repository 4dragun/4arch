#!/usr/bin/env bash

PK="sudo pacman-key"
PU="sudo pacman -U --needed --noconfirm"

YS="yay -S --needed --noconfirm"

C1="https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst"
C2="https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst"

G1="https://github.com/vinceliuice/Tela-circle-icon-theme"
G2="https://github.com/NvChad/starter"

ERRMSG="~ invalid response! try again!"

ZSF="$HOME/.config/ZORIGINAL_SYSTEM_FILES"

WALL="$HOME/4arch/walls/wallhaven-7jgyre_1920x1080.png"

cd "$HOME"
echo
echo "* WELCOME TO 4ARCH POST-INSTALL SCRIPT"
echo
echo "* RUNNING PACMAN-KEY"
echo
$PK --init
echo
$PK --populate archlinux
echo

while true; do
  read -p "? CONFIGURE LOCAL DOTFILES, ICONS, THEMES (y/n) = " itd
  echo
  itd="${itd,,}"

  if [[ "$itd" == "y" ]]; then
    rm -rfv "$HOME/.config/ZTELA"
    echo
    rm -rfv "$HOME/.config/nvim"
    echo
    rm -rfv "$HOME/.local/state/nvim"
    echo
    rm -rfv "$HOME/.local/share/nvim"
    echo
    echo "> CLONING TELA-CIRCLE-ICON-THEME"
    echo
    git clone "$G1" "$HOME/.config/ZTELA"
    echo
    echo "> CLONING NVCHAD"
    echo
    git clone "$G2" "$HOME/.config/nvim"
    echo
    cp -rfv "$HOME/4arch/confs/." "$HOME/.config"
    echo
    break
  elif [[ "$itd" == "n" ]]; then
    echo "~ skipped dotfiles, icons, themes setup"
    echo
    break
  else
    echo "$ERRMSG"
    echo
  fi
done

while true; do
  read -p "? INSTALL YAY - Yet Another AUR Helper (y/n) = " yas
  echo
  yas="${yas,,}"

  if [[ "$yas" == "y" ]]; then
    sudo pacman -S --needed --noconfirm git base-devel
    echo
    rm -rfv "$HOME/yay-bin"
    echo
    echo "> CLONING YAY"
    echo
    git clone "https://aur.archlinux.org/yay-bin.git"
    echo
    cd "$HOME/yay-bin" || { exit; }
    makepkg -si --noconfirm
    cd "$HOME"
    yay --noconfirm || { exit; }
    echo
    break
  elif [[ "$yas" == "n" ]]; then
    echo "~ skipped yay setup"
    echo
    break
  else
    echo "$ERRMSG"
    echo
  fi
done

while true; do
  read -p "? ADD CHAOTIC-AUR REPO (y/n) = " cas
  echo
  cas="${cas,,}"
  
  if [[ "$cas" == "y" ]]; then
    echo "* ADDING CHAOTIC-AUR REPO"
    echo
    $PK --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
    echo
    $PK --lsign-key 3056513887B78AEB
    echo
    $PU "$C1"
    echo
    $PU "$C2"
    echo
    break
  elif [[ "$cas" == "n" ]]; then
    echo "~ skipped chaotic-aur setup"
    echo
    break
  else
    echo "$ERRMSG"
    echo
  fi
done

while true; do
  read -p "? CHAOTIC-AUR SETUP SUCCEEDED (y/n) = " chas
  echo
  chas="${chas,,}"

  if [[ "$chas" == "n" ]]; then

    while true; do
      read -p "? REBOOT NOW (y/n) = " ras
      echo
      ras="${ras,,}"

      if [[ "$ras" == "y" ]]; then
        sleep 1
        sync && sync && sync && systemctl reboot
      elif [[ "$ras" == "n" ]]; then
        echo "~ reboot manually!"
        echo
        exit
      else
        echo "$ERRMSG"
        echo
      fi
    done
  elif [[ "$chas" == "y" ]]; then
    echo "* CHAOTIC-AUR SETUP WENT SMOOTH"
    echo
    break
  else
    echo "$ERRMSG"
    echo
  fi
done

while true; do
  read -p "? BACKUP SYSTEM_FILES (y/n) = " cop
  echo
  cop="${cop,,}"

  if [[ "$cop" == "y" ]]; then
    while true; do
      read -p "? NOW ENTER KEY: " kas
      echo

      if [[ "$kas" == "archydoes" ]]; then
        echo "* KEY MATCHES, PROCEEDING"
        echo

        if [[ -d "$ZSF" ]]; then
          echo "* BACKUP FOLDER ALREADY EXISTS! SKIPPING BACKUP!"
          echo
          break
        else
          echo "* CREATING ZORIGINAL_SYSTEM_FILES FOLDER"
          echo
          sudo mkdir -pv "$ZSF" || { exit; }
          echo
          echo "* BACKUP INCOMING"
          echo
          sudo cp -rfv /etc/mkinitcpio.conf "$ZSF" || { exit; }
          sudo cp -rfv /etc/pacman.conf     "$ZSF" || { exit; }
          echo
          echo "* SECURING THE BACKUP"
          echo
          sudo chattr -V +i "$ZSF" || { exit; }
          echo
          echo "* SYSTEM_FILES BACKUP COMPLETE!"
          echo
          break
        fi
      else
        echo "~ wrong key dude, try again!"
        echo
      fi
    done
    break
  elif [[ "$cop" == "n" ]]; then
    echo "~ skipped system_files backup!"
    echo
    break
  else
    echo "$ERRMSG"
    echo
  fi
done

while true; do
  read -p "? REPLACE SYSTEM_FILES WITH CUSTOM ONES (y/n) = " sas
  echo
  sas="${sas,,}"

  if [[ "$sas" == "y" ]]; then
    if [[ -d "$ZSF" ]]; then
      echo "* BACKUP FOLDER FOUND!"
      echo
      echo "* PROCEEDING"
      echo
      sudo cp -rfv "$HOME/4arch/confs_system/." "/etc" || { exit; }
      echo
      break
    else
      echo "* BACKUP FOLDER NOT FOUND!"
      echo
      echo "* CANNOT PROCEED!"
      echo
      exit
    fi
  elif [[ "$sas" == "n" ]]; then
    echo "~ skipped replacing system_files with custom ones"
    echo
    break
  else
    echo "$ERRMSG"
    echo
  fi
done

while true; do
  read -p "? RUN MKINITCPIO (y/n) = " mas
  echo
  mas="${mas,,}"

  if [[ "$mas" == "y" ]]; then
    echo "* RUNNING MKINITCPIO"
    echo
    sudo mkinitcpio -P
    echo
    break
  elif [[ "$mas" == "n" ]]; then
    echo "~ skipped mkinitcpio"
    echo
    break
  else
    echo "$ERRMSG"
    echo
  fi
done

echo "* UPDATING SYSTEM WITH YAY"
echo
yay --noconfirm || { exit; }
echo
echo "* INSTALLING AUR PACKAGES"
echo
$YS clipse-bin matugen-bin
echo
echo "* INSTALLING INTERNAL DEPENDENCIES"
echo
$YS bibata-cursor-theme adw-gtk-theme darkly-qt6-git \
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
echo "* FINISHED INSTALLING APPLICATIONS"
echo

echo "* CREATING XDG DIRECTORIES"
xdg-user-dirs-update
echo
mkdir -pv "$HOME/Pictures/Screenshots"
echo

echo "* BUILDING THEMES WITH MATUGEN"
echo
matugen image "$WALL"
echo
echo "$WALL" > "$HOME/.cache/last_wall.txt"

# PROBABLY GOING AWAY...................
# echo "* SETTING FOLDER THEME"
# echo
# papirus-folders -C violet
# echo

echo "* ENABLING SERVICES"
echo
sudo systemctl enable power-profiles-daemon sddm
echo
# CONFUSION GOIN ON ABOUT THIS SECTION CHECK AFTER INSTALL AND CONFIRM
# sudo systemctl --user enable pipewire-pulse.service wireplumber.service
echo

echo "* REMOVING 4ARCH REPO FROM ROOT DIRECTORY"
echo
sudo rm -rfv /root/4arch
echo

while true; do
  read -p "? 4ARCH SCRIPT ENDED, REBOOT NOW (y/n) = " nas
  echo
  nas="${nas,,}"

  if [[ "$nas" == "y" ]]; then
    echo "* REBOOT INITIATED"
    echo
    sleep 1
    sync && sync && sync && systemctl reboot
  elif [[ "$nas" == "n" ]]; then
    echo "* OKAY, REBOOT MANUALLY!"
    echo
    exit
  else
    echo "$ERRMSG"
    echo
  fi
done
