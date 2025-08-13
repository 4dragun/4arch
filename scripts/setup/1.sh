#!/usr/bin/env bash

YU="yay -U --needed --noconfirm"
YS="yay -S --needed --noconfirm"

ZSF="$HOME/.config/ZORIGINAL_SYSTEM_FILES"

WALL="$HOME/4arch/walls/wallhaven-7jgyre_1920x1080.png"

echo -e "\n WELCOME to 4ARCH Script \n"

echo " >>> running PACMAN-KEY before proceeding >>>"
sudo pacman-key --init
echo
sudo pacman-key --populate archlinux
echo

fish ignore-this-shyit
echo

read -p " -> configure local DOTFILES, ICONS, THEMES ? (y/n) = " itd
echo
read -p " -> install YAY - Yet Another AUR Helper ? (y/n) = " yas
echo
read -p " -> add CHAOTIC-AUR repo ? (y/n) = " cas
echo

if [[ "$itd" = y ]]; then
  rm -rf ~/.config/nvim
  rm -rf ~/.local/state/nvim
  rm -rf ~/.local/share/nvim

  echo -e "\n === cloning NvChad ===\n"

  git clone https://github.com/NvChad/starter ~/.config/nvim
  echo
  cp -r ~/4arch/confs/. ~/.config
  echo
  mv ~/.config/.gitconfig ~/
  echo
else
  echo " ___ skipped DOTFILES, ICONS, THEMES setup ___"
fi

if [[ "$yas" = y ]]; then
  echo
  sudo pacman -S --needed --noconfirm git base-devel
  echo
  echo " === cloning YAY ==="
  echo
  rm -rf ~/yay-bin
  echo
  git clone https://aur.archlinux.org/yay-bin.git
  echo
  cd yay-bin && makepkg -si --noconfirm && cd && yay --noconfirm
  echo
else
  echo
  echo " ___ skipped YAY setup ___"
fi

if [[ "$cas" = y ]]; then
  echo
  echo " ... adding CHAOTIC-AUR repo ..."
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
  echo
  echo " ___ skipped CHAOTIC-AUR setup ___"
  echo
fi

read -p " -> Shyit went down ? REBOOT now ? (y/n) = " ras
if [[ "$ras" = y ]]; then
  echo
  sync && sync && sync && systemctl reboot
else
  echo
  echo " ~~~ CHAOTIC-AUR added SUCCESSFULLY ~~~"
  echo
fi

read -p " -> backup ORIGINAL_SYSTEM_FILES as sudo ? (y/n) = " cop
if [[ "$cop" = y ]]; then
  echo
  read -p " ======> now enter PASS: " pas
  if [[ "$pas" = archydoes ]]; then
    if [[ -d "$ZSF" ]]; then
      echo
      echo " >>> BACKED-UP FOLDER ALREADY EXISTS ..! skipping backup <<<"
      echo
    else
      echo
      echo " >>> creating ZORIGINAL_SYSTEM_FILES folder ..."
      echo
      sudo mkdir -p "$ZSF"
      echo
      echo " >>> backing-up files now ..."
      echo
      sudo cp -r /etc/systemd/logind.conf "$ZSF"
      sudo cp -r /etc/systemd/sleep.conf "$ZSF"
      sudo cp -r /etc/mkinitcpio.conf "$ZSF"
      sudo cp -r /etc/pacman.conf "$ZSF"
      sudo chattr +i "$ZSF"
      echo
      echo " <<< ORIGINAL_SYSTEM_FILES Backup Complete >>>"
      echo
    fi
  else
    echo
    echo " ___ wrong pass dude :( ___"
    echo
    exit
  fi
else
  echo
  echo " ___ skipped BACKUP of original system files ___"
  echo
fi

read -p " -> replace SYSTEM_FILES with custom ones ? (y/n) = " sas
if [[ "$sas" = y ]]; then
  if [[ -d "$ZSF" ]]; then
    echo
    echo " --- backup folder found ---"
    echo " --- proceeding ---"
    echo
    sudo cp -r 4arch/confs2/. /etc
  else
    echo
    echo " --- backup folder was not found ---"
    echo " --- cannot procede ---"
    echo
    exit
  fi
else
  echo
  echo " ___ skipped replacing SYSTEM_FILES with custom ones ___"
  echo
fi

read -p " -> run MKINITCPIO -P ? (y/n) = " mas
if [[ "$mas" = y ]]; then
  echo
  sudo mkinitcpio -P
  echo
else
  echo
  echo " ___ skipped MKINITCPIO -P ___"
  echo
fi

echo " >>> running YAY to update >>>"
echo
yay --noconfirm
echo

echo "installing AUR-apps..."
$YS clipse-bin matugen-bin
echo
echo "installing DEPENDENCIES..."
$YS bibata-cursor-theme adw-gtk-theme darkly-qt6-git \
    papirus-icon-theme papirus-folders \
    lua-language-server
echo
echo "installing FONTS..."
$YS noto-fonts noto-fonts-cjk noto-fonts-extra noto-fonts-emoji \
    ttf-jetbrains-mono-nerd
echo
echo "installing HYPRLAND-stuff..."
$YS hyprland xdg-desktop-portal-hyprland xdg-desktop-portal-kde grimblast \
    qt5-wayland hypridle hyprlock hyprpicker hyprpolkitagent hyprpaper
echo
echo "installing GUI-apps..."
$YS sddm brave emote pavucontrol telegram-desktop mpv gwenview rofi-wayland \
    firefox nwg-look blueman qbittorrent swaync reflector-simple neovide \
    waybar nwg-look network-manager-applet dolphin ark swappy \
    kdialog systemsettings
echo
echo "installing CLI-apps..."
$YS fzf lsd bat pacseek fastfetch btop udiskie kitty aria2 \
    git-credential-manager-bin yazi wl-clipboard brightnessctl starship \
    power-profiles-daemon xdg-user-dirs
echo

xdg-user-dirs-update
echo
mkdir -p ~/Pictures/Screenshots
echo
# kbuildsycoca6
echo

echo " -> reached MATUGEN color generation area <-"
echo
matugen image "$WALL"
echo
echo "$WALL" > "$HOME/.cache/last-wall.txt"
echo
papirus-folders -C violet

echo " ... enabling SERVICES ..."
sudo systemctl enable power-profiles-daemon \
                      sddm
echo

sudo rm -rf /root/4arch

read -p " ... 4ARCH Script Ended. REBOOT now ? (y/n) = " nas
echo
if [[ "$nas" = y ]]; then
  sync && sync && sync && systemctl reboot
else
  echo
  echo " === Alrighty then, Reboot manually ==="
  echo
fi
