#!/usr/bin/env bash

YU="yay -U --needed --noconfirm"
YS="yay -S --needed --noconfirm"

PACONF="/etc/pacman.conf"
PACBAK="$PACONF.bak"
PACTMP="$(mktemp)"

LOGCONF="/etc/systemd/logind.conf"
LOGBACK="$LOGCONF.bak"
LOGTEMP="$(mktemp)"

SLEEPCONF="/etc/systemd/sleep.conf"
SLEEPBAKP="$SLEEPCONF.bak"
SLEEPTEMP="$(mktemp)"

MKINITCONF="/etc/mkinitcpio.conf"
MKINITBAKP="$MKINITCONF.bak"
MKINITTEMP="$(mktemp)"

echo && echo ".......WELCOME TO 4ARCH Script......." && echo

echo " >>> Running pacman-key steps before proceeding ..."
sudo pacman-key --init && echo
sudo pacman-key --populate archlinux && echo

fish ignore-this-shyit && echo

echo && read -p "configure local DOTFILES, ICONS, THEMES..? (y/n)  " itd
echo && read -p "install YAY - Yet Another AUR Helper..? (y/n)  " yas
echo && read -p "configure CHAOTIC-AUR repo..? (y/n)  " cas

if [[ $itd = y ]]; then
  echo && mkdir -p ~/.icons
          mkdir -p ~/.local/share/icons
  tar -xf ~/4arch/azzets/kora.tar.xz -C ~/.icons
  tar -xf ~/4arch/azzets/kora.tar.xz -C ~/.local/share/icons
  
  echo && rm -rf ~/.config/nvim
          rm -rf ~/.local/state/nvim
          rm -rf ~/.local/share/nvim

  echo && echo "CLONING NvChad..." && echo
  git clone https://github.com/NvChad/starter ~/.config/nvim && echo
  
  cp -r ~/4arch/confs ~/.config
else
  echo && echo "skipped DOTFILES, ICONS, THEMES setup..!" && echo
fi

if [[ $yas = y ]]; then
  echo && rm -rf ~/yay-bin && echo
  
  sudo pacman -S --needed --noconfirm git base-devel
  git clone https://aur.archlinux.org/yay-bin.git
  cd yay-bin && makepkg -si --noconfirm && cd && yay --noconfirm
  echo
else
  echo && echo "skipped YAY setup..!" && echo
fi

if [[ $cas = y ]]; then
  echo && echo "Setting up CHAOTIC-AUR now..." && echo
  sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
  sudo pacman-key --lsign-key 3056513887B78AEB
  $YU 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'
  $YU 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
else
  echo && echo "skipped CHAOTIC-AUR setup..!" && echo
fi

echo && read -p "shit went down..? REBOOT now..? (y/n)  " ras
if [[ $ras = y ]]; then
  echo && sync && sync && sync && systemctl reboot
else
  echo && echo "CHAOTIC-AUR stuff SUCCESSFUL...!" && echo
fi

echo && read -p "============> Auto-Edit PACMAN.CONF ..? (y/n)  " pas
if [[ "$pas" == y ]]; then
  echo && echo "<<<<<<< PACMAN.CONF auto-edit INCOMING >>>>>>>" && echo

  echo "Backing up the PACMAN CONF file..." && echo
  sudo cp "$PACONF" "$PACBAK" || { echo "Backup failed. ENDING."; exit 190; }

  awk '
    $0 == "[options]" {
      print
      print "ILoveCandy"
      print "VerbosePkgLists"
      print "Color"
      next
    }

    $0 == "[multilib]" {
      in_multilib = 1
      print
      next
    }

    in_multilib && /^Include =/ {
      print
      print ""
      print "[chaotic-aur]"
      print "Include = /etc/pacman.d/chaotic-mirrorlist"
      in_multilib = 0
      next
    }

    { print }
  ' "$PACONF" > "$PACTMP"

  echo "Replacing pacman.conf with the modified version..."
  sudo cp "$PACTMP" "$PACONF" && rm "$PACTMP" && echo
  echo " <><><><><><> PACONF Edit Successful ..! <><><><><><>"
else
  echo && echo " ~~~~~~~~~~ PACMAN.CONF edit cancelled ~~~~~~~~~~ "
fi

echo && echo "-=-=-=-==> Running YAY to install programs <<<<<< "
echo && yay --noconfirm || { echo "YAY failed, check configuration ..! "; }

echo && echo "installing AUR-apps..."
$YS clipse-bin ttf-rubik-vf matugen-bin

echo && echo "installing DEPENDENCIES..."
$YS ffmpegthumbnailer python-pillow bibata-cursor-theme
$YS adw-gtk-theme gvfs-mtp

echo && echo "installing FONTS..."
$YS noto-fonts noto-fonts-cjk noto-fonts-extra ttf-font-awesome
$YS noto-fonts-emoji ttf-jetbrains-mono-nerd

echo && echo "installing HYPRLAND-stuff..."
$YS hyprland xdg-desktop-portal-hyprland xdg-desktop-portal-gtk uwsm grimblast
$YS qt5-wayland hypridle hyprlock hyprpicker hyprpolkitagent hyprpaper

echo && echo "installing GUI-apps..."
$YS sddm brave emote pavucontrol telegram-desktop mpv eog rofi-wayland
$YS firefox nwg-look blueman qbittorrent swaync reflector-simple
$YS waybar nwg-look qt6ct network-manager-applet nautilus

echo && echo "installing CLI-apps..."
$YS fzf lsd bat pacseek fastfetch htop btop udiskie ghostty wget
$YS git-credential-manager-bin yazi wl-clipboard brightnessctl starship
$YS lua-language-server power-profiles-daemon xdg-user-dirs aria2

echo && xdg-user-dirs-update && mkdir -p ~/Pictures/Screenshots

echo && echo " >>>> reached MATUGEN color generation area >>>> " && echo
matugen image ~/4arch/walls/Fantasy-Hongkong.png -c ~/.config/matugen/init.toml
echo "/home/archy/4arch/walls/Fantasy-Hongkong.png">"$HOME/.cache/last-wall.txt"

echo && echo "enabling POWER-PROFILES-DAEMON..."
sudo systemctl enable --now power-profiles-daemon

echo && echo "__________ Auto-Edit LOGIND.CONF _______? (y/n)  " las
if [[ $las = y ]]; then
  echo && read -p "--- --- LOGIND.CONF auto-edit INCOMING == == " && echo
  echo "Backing up the LOGIND CONF file..." && echo
  sudo cp "$LOGCONF" "$LOGBACK" || { echo "Backup failed. ENDING."; exit 200; }

  awk '
    /^\[Login\]/ {
      print
      print "HandlePowerKey=suspend-then-hibernate"
      print "HandleLidSwitch=suspend-then-hibernate"
      next
    }
    /^HandlePowerKey=/ || /^HandleLidSwitch=/ {
      next
    }
    { print }
  ' "$LOGCONF" > "$LOGTEMP"

  echo "Replacing logind.conf with the modified version..."
  sudo cp "$LOGTEMP" "$LOGCONF" && rm "$LOGTEMP" && echo
  echo " <>_________<> LOGIND.CONF Edit Successful ..! ____--------<>"
else
  echo && echo " ........ LOGIND.CONF edit cancelled ~~~~~~~~~~ "
fi

echo && read -p "-------> Auto-Edit SLEEP.CONF .......? (y/n)  " sas
if [[ $sas = y ]]; then
  echo && echo "----...... SLEEP.CONF auto-edit INCOMING >>>>" && echo
  echo "Backing up the SLEEP CONF file..." && echo
  sudo cp "$SLEEPCONF" "$SLEEPBAKP" || { echo "Backup failed.."; exit 28; }

  awk '
    /^\[Sleep\]/ {
      print
      print "HibernateDelaySec=1800"
      next
    }
    /^HibernateDelaySec=/ {
      next
    }
    { print }
  ' "$SLEEPCONF" > "$SLEEPTEMP"

  echo "Replacing sleep.conf with the modified version..."
  sudo cp "$SLEEPTEMP" "$SLEEPCONF" && rm "$SLEEPTEMP" && echo
  echo " _________ SLEEP.CONF Edit Successful ..! ----____  "
else
  echo && echo " +++++ SLEEP.CONF edit cancelled <++++++ "
fi

echo && read -p " ~~~~---> Auto-Edit MKINITCONF ____? (y/n)  " mas
if [[ $mas = y ]]; then
  echo && echo "<====> MKINITCONF auto-edit INCOMING ._. "
  echo && echo " ...Backing up the MKINITCONF file..." && echo
  sudo cp "$MKINITCONF" "$MKINITBAKP" || { echo "Backup failed."; exit 63; }

  awk '
    BEGIN { changed = 0 }
    /^\s*HOOKS=\(.*filesystems.*fsck.*\)/ {
      line = $0
      if (line ~ /resume/) {
        print line
      } else {
        sub(/filesystems/, "filesystems resume", line)
        print line
        changed = 1
      }
      next
    }
    { print }
    END { exit changed }
  ' "$MKINITCONF" > "$MKINITTEMP"

  if [[ $? -eq 1 ]]; then
    echo "File modified, updating and running mkinitcpio -P linux..."
    sudo cp "$MKINITTEMP" "$MKINITCONF"
    echo && sudo mkinitcpio -P linux && echo
    echo ":) all MKINIT went successful ..!" && echo
  else
    echo "No changes detected, skipping mkinitcpio."
  fi

  sudo rm "$MKINITTEMP"
else
  echo && echo "=***=> MKINITCONF edit cancelled ..__.."
fi

echo && read -p " 4ARCH Script Ended. REBOOT now ..? (y/n)  " nas
if [[ $nas = y ]]; then
  sync && sync && sync && systemctl reboot
else
  echo && echo " Alrighty, Reboot cancelled. "
fi
