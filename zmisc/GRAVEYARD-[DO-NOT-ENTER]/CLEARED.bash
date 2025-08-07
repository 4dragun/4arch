YU="yay -U --needed --noconfirm"
YS="yay -S --needed --noconfirm"
NW="~/.config/systemd/user/niri.service.wants"

mkdir -p ~/.icons
mkdir -p ~/.local/share/icons
tar -xf ~/4arch/azzets/kora.tar.xz -C ~/.icons
tar -xf ~/4arch/azzets/kora.tar.xz -C ~/.local/share/icons

mkdir -p ~/.themes
mkdir -p ~/.local/share/themes
mkdir -p ~/.config/Kvantum
mkdir -p $NW

tar -xf ~/4arch/icandy/Sweet-Dark.tar.xz -C ~/.themes
tar -xf ~/4arch/icandy/Sweet-Dark.tar.xz -C ~/.local/share/themes
tar -xf ~/4arch/icandy/Sweet.tar.xz      -C ~/.config/Kvantum

ln -s /usr/lib/systemd/user/waybar.service $NW
ln -s /usr/lib/systemd/user/swaync.service $NW
ln -s ~/.config/systemd/user/swaybg.service $NW

echo "installing NIRI-stuff..."
$YS niri gnome-keyring xdg-desktop-portal-gnome xdg-desktop-portal-gtk
$YS polkit-kde-agent xwayland-satellite swaybg swaylock-effects swayidle
$YS hyprpicker
