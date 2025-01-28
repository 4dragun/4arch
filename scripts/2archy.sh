echo .........................................................................
cd
git clone https://github.com/orangci/walls-catppuccin-mocha
swww img ~/walls-catppuccin-mocha/pompeii.png

wl-copy < ~/4end/scripts/neovim.txt
git clone https://github.com/NvChad/starter ~/.config/nvim
nvim ~/.config/nvim/init.lua

echo SYSTEM-FILES SETUP.......................................................
wl-copy HandlePowerKey=suspend-then-hibernate
sudoedit /etc/systemd/logind.conf
wl-copy HibernateDelaySec=2400s
sudoedit /etc/systemd/sleep.conf

echo PACKAGES SETUP...........................................................
yay -S --needed clipse-bin ags-hyprpanel-git

echo MYAPPS SETUP.............................................................
echo y | yay -Rs yazi
echo y | yay -S --needed yazi-git brave librewolf emote pavucontrol
echo y | yay -S --needed telegram-desktop lsd bat nautilus mpv eog grimblast
echo y | yay -S --needed fuzzel pacseek nwg-look fastfetch htop blueman btop
echo y | yay -S --needed qt5ct qt6ct kvantum-qt5 power-profiles-daemon

echo myAPPS-DEPENDENCIES SETUP................................................
echo y | yay -S --needed ffmpegthumbnailer python-pillow

sudo systemctl enable --now power-profiles-daemon

nwg-look

echo REBOOT REBOOT REBOOT REBOOT REBOOT REBOOT REBOOT REBOOT REBOOT REBOOT 
