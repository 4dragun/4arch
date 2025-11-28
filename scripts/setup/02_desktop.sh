#!/usr/bin/env bash

PK="sudo pacman-key"
PU="sudo pacman -U --needed --noconfirm"

YS="yay -S --needed --noconfirm"

C1="https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst"
C2="https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst"

G1="https://github.com/vinceliuice/Tela-circle-icon-theme"
G2="https://github.com/NvChad/starter"

ZSF="$HOME/.config/ZORIGINAL_SYSTEM_FILES"

WALL="$HOME/4arch/walls/wallhaven-7jgyre_1920x1080.png"

ERRMSG="~ invalid response! try again!"

cd "$HOME"
echo -e "\n* WELCOME TO 4ARCH POST-INSTALL SCRIPT\n"
echo -e "\n* RUNNING PACMAN-KEY\n"
$PK --init; echo
$PK --populate archlinux; echo

while true; do
  read -p "? CONFIGURE LOCAL DOTFILES, ICONS, THEMES (y/n) = " itd
  echo
  itd="${itd,,}"

  if [[ "$itd" == "y" ]]; then
    rm -rf "$HOME/.config/ZTELA"
    rm -rf "$HOME/.config/nvim"
    rm -rf "$HOME/.local/state/nvim"
    rm -rf "$HOME/.local/share/nvim"

    echo -e "\n> CLONING TELA-CIRCLE-ICON-THEME\n"
    git clone "$G1" "$HOME/.config/ZTELA"
    echo -e "\n> CLONING NVCHAD\n"
    git clone "$G2" "$HOME/.config/nvim"

    echo; cp -rf "$HOME/4arch/confs/." "$HOME/.config"
    echo; cp -rf "$HOME/.config/.gitconfig" "$HOME"
    echo; rm -rf "$HOME/.config/.gitconfig"; break
  elif [[ "$itd" == "n" ]]; then
    echo -e "\n~ skipped dotfiles, icons, themes setup\n"; break
  else
    echo -e "\n$ERRMSG\n"
  fi
done

while true; do
  read -p "? INSTALL YAY - Yet Another AUR Helper (y/n) = " yas
  echo
  yas="${yas,,}"

  if [[ "$yas" == "y" ]]; then
    sudo pacman -S --needed --noconfirm git base-devel; echo
    rm -rf "$HOME/yay-bin"
    
    echo -e "\n> CLONING YAY\n"
    git clone "https://aur.archlinux.org/yay-bin.git"; echo

    cd "$HOME/yay-bin" || exit
    makepkg -si --noconfirm
    cd "$HOME"
    yay --noconfirm || exit
    echo; break
  elif [[ "$yas" == "n" ]]; then
    echo -e "\n~ skipped yay setup\n"; break
  else
    echo -e "\n$ERRMSG\n"
  fi
done

while true; do
  read -p "? ADD CHAOTIC-AUR REPO (y/n) = " cas
  echo
  cas="${cas,,}"
  
  if [[ "$cas" == "y" ]]; then
    echo -e "\n* ADDING CHAOTIC-AUR REPO\n"
    $PK --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com; echo
    $PK --lsign-key 3056513887B78AEB; echo
    $PU "$C1"; echo
    $PU "$C2"; echo; break
  elif [[ "$cas" == "n" ]]; then
    echo -e "\n~ skipped chaotic-aur setup\n"; break
  else
    echo -e "\n$ERRMSG\n"
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
        sleep 1; sync; sync; sync; systemctl reboot
      elif [[ "$ras" == "n" ]]; then
        echo -e "\n~ reboot manually!\n"; exit
      else
        echo -e "\n$ERRMSG\n"
      fi
    done
  elif [[ "$chas" == "y" ]]; then
    echo -e "\n* CHAOTIC-AUR SETUP WENT SMOOTH\n"; break
  else
    echo -e "\n$ERRMSG\n"
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
        echo -e "\n* KEY MATCHES, PROCEEDING\n"

        if [[ -d "$ZSF" ]]; then
          echo -e "\n* BACKUP FOLDER EXISTS! SKIPPING BACKUP!\n"; break
        else
          echo -e "\n* CREATING ZORIGINAL_SYSTEM_FILES FOLDER\n"; echo
          sudo mkdir -p "$ZSF" || exit
          echo -e "\n* BACKUP INCOMING\n"
          sudo cp -rf /etc/mkinitcpio.conf "$ZSF" || exit
          sudo cp -rf /etc/pacman.conf     "$ZSF" || exit
          echo -e "\n* SECURING THE BACKUP\n"
          sudo chattr -V +i "$ZSF" || exit
          echo -e "\n* SYSTEM_FILES BACKUP COMPLETE!\n"; break
        fi
      else
        echo -e "\n~ wrong key dude, try again!\n"
      fi
    done
    break
  elif [[ "$cop" == "n" ]]; then
    echo -e "\n~ skipped system_files backup!\n"; break
  else
    echo -e "\n$ERRMSG\n"
  fi
done

while true; do
  read -p "? REPLACE SYSTEM_FILES WITH CUSTOM ONES (y/n) = " sas
  echo
  sas="${sas,,}"

  if [[ "$sas" == "y" ]]; then
    if [[ -d "$ZSF" ]]; then
      echo -e "\n* BACKUP FOLDER FOUND!\n"
      echo -e "\n* PROCEEDING\n"
      sudo cp -rf "$HOME/4arch/confs_system/." "/etc" || exit
      break
    else
      echo -e "\n* BACKUP FOLDER NOT FOUND!\n"
      echo -e "\n* CANNOT PROCEED!\n"; exit
    fi
  elif [[ "$sas" == "n" ]]; then
    echo -e "\n~ skipped replacing system-files with custom ones\n"; break
  else
    echo -e "\n$ERRMSG\n"
  fi
done

while true; do
  read -p "? RUN MKINITCPIO (y/n) = " mas
  echo
  mas="${mas,,}"

  if [[ "$mas" == "y" ]]; then
    echo -e "\n* RUNNING MKINITCPIO\n"
    sudo mkinitcpio -P; echo; break
  elif [[ "$mas" == "n" ]]; then
    echo -e "\n~ skipped mkinitcpio\n"; break
  else
    echo -e "\n$ERRMSG\n"
  fi
done

echo -e "\n* UPDATING SYSTEM WITH YAY\n"
yay --noconfirm || exit

echo -e "\n* INSTALLING AUR PACKAGES\n"
$YS ttf-rubik-vf cable

echo -e "\n* INSTALLING INTERNAL DEPENDENCIES\n"
$YS bibata-cursor-theme adw-gtk-theme darkly-qt6-git \
    lua-language-server gst-plugins-bad xdg-user-dirs

echo -e "\n* INSTALLING FONTS\n"
$YS noto-fonts noto-fonts-cjk noto-fonts-extra noto-fonts-emoji \
    ttf-jetbrains-mono-nerd

echo -e "\n* INSTALLING HYPRLAND AND ITS DEPENDENCIES\n"
$YS hyprland xdg-desktop-portal-hyprland xdg-desktop-portal-kde grimblast \
    qt5-wayland hypridle hyprlock hyprpicker hyprpolkitagent hyprpaper

echo -e "\n* INSTALLING GUI APPLICATIONS\n"
$YS sddm brave emote pavucontrol telegram-desktop mpv gwenview rofi-wayland \
    nwg-look blueman qbittorrent swaync reflector-simple neovide \
    waybar network-manager-applet dolphin swappy systemsettings kdialog \
    p7zip-gui zen-browser-bin strawberry

echo -e "\n* INSTALLING CLI APPLICATIONS\n"
$YS fzf lsd bat pacseek fastfetch btop udiskie kitty aria2 yazi starship \
    git-credential-manager-bin wl-clipboard brightnessctl alsa-utils \
    power-profiles-daemon clipse matugen

echo -e "\n* FINISHED INSTALLING APPLICATIONS\n"

echo -e "\n* CREATING XDG DIRECTORIES\n"
xdg-user-dirs-update
mkdir -p "$HOME/Pictures/Screenshots"

echo -e "\n* BUILDING THEMES WITH MATUGEN\n"
matugen image "$WALL"; echo
echo "$WALL" > "$HOME/.cache/last_wall.txt"

# PROBABLY GOING AWAY...................
# echo "* SETTING FOLDER THEME"
# echo
# papirus-folders -C violet
# echo

echo -e "\n* ENABLING SERVICES\n"
sudo systemctl enable power-profiles-daemon sddm; echo
# CONFUSION GOIN ON ABOUT THIS SECTION CHECK AFTER INSTALL AND CONFIRM
# sudo systemctl --user enable pipewire-pulse.service wireplumber.service

echo -e "\n* REMOVING 4ARCH REPO FROM ROOT DIRECTORY\n"
sudo rm -rf /root/4arch; echo

while true; do
  read -p "? 4ARCH SCRIPT ENDED, REBOOT NOW (y/n) = " nas
  echo
  nas="${nas,,}"

  if [[ "$nas" == "y" ]]; then
    echo -e "\n* REBOOT INITIATED\n"
    sleep 1; sync; sync; sync; systemctl reboot
  elif [[ "$nas" == "n" ]]; then
    echo -e "\n* OKAY, REBOOT MANUALLY!\n"; exit
  else
    echo -e "\n$ERRMSG\n"
  fi
done
