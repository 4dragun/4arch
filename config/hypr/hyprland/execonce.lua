local S = "sleep 1 && systemctl --user start "
local R = "/home/archy/.config/hypr/hyprland/scripts/"

hl.on("hyprland.start", function ()
    hl.exec_cmd(R .. "wallpaper/load.sh")
    hl.exec_cmd(R .. "misc/first_run.sh")
    hl.exec_cmd(R .. "misc/dconf.sh")

    hl.exec_cmd("nm-applet")
    hl.exec_cmd("clipse -listen")
    hl.exec_cmd("kitty")

    hl.exec_cmd(S .. "waybar")
    hl.exec_cmd(S .. "swaync")
    hl.exec_cmd(S .. "hypridle")
    hl.exec_cmd(S .. "hyprpolkitagent")
end)
