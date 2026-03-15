#!/usr/bin/env bash

YS="yay -S --needed --noconfirm"

G1="https://github.com/vinceliuice/Tela-circle-icon-theme"
G2="https://github.com/NvChad/starter"

WALL="$HOME/4arch/walls/magician-walks-magical-tree-houses-illustration.jpg"

ERRMSG="ERROR: invalid response! (try y or n)"

cd "$HOME"; echo -e "\n* WELCOME TO 4ARCH POST-INSTALL SCRIPT\n"

while true; do
  read -p "? CONFIGURE LOCAL DOTFILES, ICONS, THEMES (y/n) = " itd
  echo
  itd="${itd,,}"

  if [[ "$itd" == "y" ]]; then
    rm -rf "$HOME/.cache/TELA-GIT"
    rm -rf "$HOME/.config/nvim"
    rm -rf "$HOME/.local/state/nvim"
    rm -rf "$HOME/.local/share/nvim"

    echo -e "\n> CLONING TELA-CIRCLE-ICON-THEME\n"
    git clone "$G1" "$HOME/.cache/TELA-GIT"
    echo -e "\n> CLONING NVCHAD\n"
    git clone "$G2" "$HOME/.config/nvim"

    echo; cp -rf "$HOME/4arch/config/." "$HOME/.config"
    echo; cp -rf "$HOME/.config/.gitconfig" "$HOME"
    echo; rm -rf "$HOME/.config/.gitconfig"; break
  elif [[ "$itd" == "n" ]]; then
    echo -e "\n~ skipped dotfiles, icons, themes setup\n"; break
  else
    echo -e "\n$ERRMSG\n"
  fi
done

while true; do
  read -p "===> INSTALL YAY? (y/n) = " yas; echo
  yas="${yas,,}"

  if [[ "$yas" == "y" ]]; then

    while true; do
      echo -e "\n>>>> YAY INSTALLATION STARTED...\n"
      
      if sudo pacman -S --needed --noconfirm git base-devel &&\
        rm -rf "$HOME/yay-bin" &&\
        git clone "https://aur.archlinux.org/yay-bin.git" "$HOME/yay-bin" &&\
        cd "$HOME/yay-bin" && makepkg -si --noconfirm &&\
        yay --noconfirm; then
        
        echo -e "\n>>>> SUCCESS: YAY installed!\n"; cd "$HOME"; break 2
      else
        echo -e "\n>>>> ERROR: YAY installation error!\n"

        while true; do
          read -p "===> RETRY: retry YAY installation? (y/n) = " retry
          retry="${retry,,}"

          if [[ "$retry" == "y" ]]; then
            echo -e "\n>>>> RETRY: retrying YAY installation...\n"; cd "$HOME"
            break
          elif [[ "$retry" == "n" ]]; then
            echo -e "\n>>>> ABORT: stopped YAY installation retry!\n"; cd "$HOME"
            break 2
          else
            clear; echo -e "\n$ERRMSG\n"
          fi
        done
      fi
    done
  elif [[ "$yas" == "n" ]]; then
    clear; echo -e "\n>>>> SKIP: skipped YAY installation!\n"; break
  else
    clear; echo -e "\n$ERRMSG\n";
  fi
done

echo -e "\n* INSTALLING AUR PACKAGES\n"
$YS ttf-rubik-vf wvkbd ayugram-desktop-bin surge-bin

echo -e "\n* INSTALLING INTERNAL DEPENDENCIES\n"
$YS bibata-cursor-theme adw-gtk-theme lua-language-server\
    gst-plugins-bad xdg-user-dirs archlinux-xdg-menu\
    libadwaita-without-adwaita-git

echo -e "\n* INSTALLING FONTS\n"
$YS noto-fonts noto-fonts-cjk noto-fonts-extra noto-fonts-emoji\
    ttf-jetbrains-mono-nerd

echo -e "\n* INSTALLING HYPRLAND AND ITS DEPENDENCIES\n"
$YS hyprland xdg-desktop-portal-hyprland xdg-desktop-portal-kde grimblast\
    qt5-wayland hypridle hyprlock hyprpicker hyprpolkitagent hyprpaper

echo -e "\n* INSTALLING GUI APPLICATIONS\n"
$YS sddm brave emote pavucontrol-qt gwenview rofi-wayland\
    nwg-look blueman qbittorrent swaync reflector-simple neovide mpv\
    waybar network-manager-applet dolphin swappy systemsettings kdialog\
    p7zip-gui zen-browser-bin strawberry

echo -e "\n* INSTALLING CLI APPLICATIONS\n"
$YS fzf lsd bat pacseek fastfetch btop udiskie kitty yazi starship\
    git-credential-manager-bin wl-clipboard brightnessctl alsa-utils\
    power-profiles-daemon clipse matugen

##########################
echo; $YS darkly-bin; echo
##########################

echo -e "\n* FINISHED INSTALLING APPLICATIONS\n"

echo -e "\n* CREATING XDG DIRECTORIES\n"
xdg-user-dirs-update
mkdir -p "$HOME/Pictures/Screenshots"

echo -e "\n* BUILDING THEMES WITH MATUGEN\n"
matugen -t scheme-content --source-color-index 0 --continue-on-error image "$WALL"
echo "$WALL" > "$HOME/.cache/last_wall.txt"

echo -e "\n* ENABLING SERVICES\n"
sudo systemctl enable power-profiles-daemon sddm; echo

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
