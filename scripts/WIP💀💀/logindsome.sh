CONF_PATH="/etc/systemd/logind.conf"
sudo cp "$CONF_PATH" "$CONF_PATH.bak"

# Delete old lines matching keys anywhere
sudo sed -i '/^HandlePowerKey=/d' "$CONF_PATH"
sudo sed -i '/^HandleLidSwitch=/d' "$CONF_PATH"

# Insert new lines after [Login]
sudo sed -i '/^\[Login\]/a\
HandlePowerKey=suspend-then-hibernate\
HandleLidSwitch=suspend-then-hibernate
' "$CONF_PATH"
