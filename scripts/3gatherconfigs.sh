echo GATHERING_CONFIGSSSSSSSS.................................................

rm -rf ~/4end/confs
mkdir ~/4end/confs

cp ~/.config/fish/config.fish ~/4end/confs
cp ~/.config/uwsm/env ~/4end/confs

cp ~/.config/kitty/kitty.conf ~/4end/confs
cp ~/.config/kitty/Catppuccin-Mocha.conf ~/4end/confs

cp ~/.config/fuzzel/fuzzel.ini ~/4end/confs

cp ~/.config/hypr/hyprland.conf ~/4end/confs
cp ~/.config/hypr/hypridle.conf ~/4end/confs
cp ~/.config/hypr/hyprlock.conf ~/4end/confs

echo GIT_SHIT.................................................................
cd
cd ~/4end
git add .
git commit -m "updte whole sht frm scrpt"
git push origin main
cd

echo DONE_MWONEY..............................................................
