#!/usr/bin/env bash

# conditions for CLEARING: success, retry, abort, errormsg, skip, ongoing

YS="paru -S --needed --noconfirm"

G1="https://github.com/vinceliuice/Tela-circle-icon-theme"
G2="https://github.com/NvChad/starter"

WALL="$HOME/4arch/walls/magician-walks-magical-tree-houses-illustration.jpg"

ERRMSG=">>>> ERROR: invalid response! (try y or n)"

clear; cd "$HOME"; echo -e "\n===> WELCOME TO 4ARCH POST-INSTALL SCRIPT\n"

while true; do
  read -p "===> CONFIGURE LOCAL DOTFILES? (y/n) = " local
  echo; local="${local,,}"

  if [[ "$local" == "y" ]]; then
    while true; do

      clear; echo -e "\n>>>> configuring DOTFILES...\n"

      if rm -rf "$HOME/.cache/TELA-GIT" "$HOME/.config/nvim"\
        "$HOME/.local/state/nvim" "$HOME/.local/share/nvim" &&\

        echo && git clone "$G1" "$HOME/.cache/TELA-GIT" &&\
        echo && git clone "$G2" "$HOME/.config/nvim" &&\

        echo && cp -rf "$HOME/4arch/config/." "$HOME/.config" &&\
        echo && mv -f "$HOME/.config/.gitconfig" "$HOME"; then

        clear; echo -e "\n>>>> SUCCESS: configured DOTFILES!\n"; break 2
      else
        echo -e "\n>>>> ERROR: error while configuring DOTFILES!\n"

        while true; do

          read -p "===> RETRY: retry DOTFILE setup? (y/n) = " das
          echo; das="${das,,}"

          if [[ "$das" == "y" ]]; then
            break
          elif [[ "$das" == "n" ]]; then
            clear; echo -e ">>>> ABORT: cancelled DOTFILES setup!\n\n"; break 3
          else
            clear; echo -e "\n$ERRMSG\n"
          fi
        done
      fi
    done
  elif [[ "$local" == "n" ]]; then
    clear; echo -e "\n>>>> SKIP: skipped DOTFILES setup\n"; break
  else
    clear; echo -e "\n$ERRMSG\n"
  fi
done

while true; do
  read -p "===> EXP. INSTALL PARU? (y/n) = " pas; echo; pas="${pas,,}"

  if [[ "$pas" == "y" ]]; then

    while true; do
      clear; echo -e "\n>>>> EXP. INSTALLING PARU...\n"

      if sudo pacman -S --needed --noconfirm paru; then
        clear; echo -e "\n>>>> SUCCESS: installed PARU!\n"; break 2
      else
        echo -e "\n>>>> ERROR: failed to install PARU!\n"

        while true; do

          read -p "===> RETRY: retry PARU installation? (y/n) = " pras
          echo; pras="${pras,,}"

          if [[ "$pras" == "y" ]]; then
            break
          elif [[ "$pras" == "n" ]]; then
            clear; echo -e "\n>>>> ABORT: cancelled PARU installation!\n"; break 3
          else
            clear; echo -e "\n$ERRMSG\n"
          fi
        done
      fi
    done
  elif [[ "$pas" == "n" ]]; then
    clear; echo -e "\n>>>> SKIP: skipped PARU installation!\n"; break
  else
    clear; echo -e "\n$ERRMSG\n"
  fi
done

while true; do
  read -p "===> INSTALL APPS & OTHER UTILITIES? (y/n) = " apps
  echo; apps="${apps,,}"

  if [[ "$apps" == "y" ]]; then

    while true; do
      
      if clear && echo -e "\n>>>> INSTALLING AUR PACKAGES...\n" &&\
        $YS ttf-rubik-vf wvkbd ayugram-desktop-bin surge-bin darkly-bin &&\

        echo -e "\n>>>> INSTALLING INTERNAL DEPENDENCIES...\n" &&\
        $YS bibata-cursor-theme adw-gtk-theme lua-language-server\
            gst-plugins-bad xdg-user-dirs archlinux-xdg-menu\
            libadwaita-without-adwaita-git &&\

        echo -e "\n>>>> INSTALLING FONTS...\n" &&\
        $YS noto-fonts noto-fonts-cjk noto-fonts-extra noto-fonts-emoji\
            ttf-jetbrains-mono-nerd &&\

        echo -e "\n>>>> INSTALLING HYPRLAND AND ITS DEPENDENCIES...\n" &&\
        $YS hyprland xdg-desktop-portal-hyprland xdg-desktop-portal-kde grimblast\
            qt5-wayland hypridle hyprlock hyprpicker hyprpolkitagent hyprpaper &&\

        echo -e "\n>>>> INSTALLING GUI APPLICATIONS...\n" &&\
        $YS sddm brave emote pavucontrol-qt gwenview rofi-wayland\
            nwg-look blueman qbittorrent swaync reflector-simple neovide mpv\
            waybar network-manager-applet dolphin swappy systemsettings kdialog\
            p7zip-gui zen-browser-bin strawberry &&\

        echo -e "\n>>>> INSTALLING CLI APPLICATIONS...\n" &&\
        $YS fzf lsd bat pacseek fastfetch btop udiskie kitty yazi starship\
            git-credential-manager-bin wl-clipboard brightnessctl alsa-utils\
            power-profiles-daemon clipse matugen; then

        clear; echo -e "\n>>>> SUCCESS: finished installing APPS & UTILS!\n"
        break 2
      else
        echo -e "\n>>>> ERROR: failed installing some APPS!\n"

        while true; do

          read -p "===> RETRY: retry installing APPS & UTILS? (y/n) = " rias
          echo; rias="${rias,,}"

          if [[ "$rias" == "y" ]]; then
            break
          elif [[ "$rias" == "n" ]]; then
            clear; echo -e "\n>>>> ABORT: cancelled APPS & UTILS installation!\n"
            break 3
          else
            clear; echo -e "\n$ERRMSG\n"
          fi
        done
      fi
    done
  elif [[ "$apps" == "n" ]]; then
    clear; echo -e "\n>>>> SKIP: skipped installing APPS & UTILS\n"; break
  else
    clear; echo -e "\n$ERRMSG\n"
  fi
done

echo -e "\n>>>> CREATING XDG DIRECTORIES...\n"
xdg-user-dirs-update; mkdir -p "$HOME/Pictures/Screenshots"

echo -e "\n>>>> ENABLING SERVICES...\n"
sudo systemctl enable power-profiles-daemon sddm

echo -e "\n>>>> REMOVING 4ARCH REPO FROM ROOT DIRECTORY...\n"
sudo rm -rf /root/4arch

while true; do
  read -p "===> 4ARCH SCRIPT ENDED, REBOOT NOW? (y/n) = " nas; echo
  nas="${nas,,}"

  if [[ "$nas" == "y" ]]; then
    clear; echo -e "\n>>>> REBOOT INITIATED...\n"
    sleep 1; sync; sync; sync; systemctl reboot
  elif [[ "$nas" == "n" ]]; then
    clear; echo -e "\n>>>> OKAY, REBOOT MANUALLY!\n"; exit
  else
    clear; echo -e "\n$ERRMSG\n"
  fi
done
