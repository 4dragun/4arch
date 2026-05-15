local T = "kitty"
local S = "/home/archy/.config/hypr/hyprland/scripts/"

hl.bind("SUPER + P", hl.dsp.window.pseudo())
hl.bind("SUPER + F", hl.dsp.window.float())
hl.bind("SUPER + C", hl.dsp.window.close())

hl.bind("SUPER + Return", hl.dsp.exec_cmd(T))
hl.bind("SUPER + E",      hl.dsp.exec_cmd(T .. " yazi"))
hl.bind("SUPER + V",      hl.dsp.exec_cmd(T .. " --class clipse clipse"))
hl.bind("SUPER + B",      hl.dsp.exec_cmd(S .. "/misc/K.sh"))
hl.bind("SUPER + W",      hl.dsp.exec_cmd("brave"))
hl.bind("SUPER + R",      hl.dsp.exec_cmd("rofi -show drun"))
hl.bind("SUPER + O",      hl.dsp.exec_cmd("emote"))
hl.bind("SUPER + I",      hl.dsp.exec_cmd("dolphin"))
hl.bind("SUPER + G",      hl.dsp.exec_cmd("gwenview"))
hl.bind("SUPER + L",      hl.dsp.exec_cmd("hyprlock"))
hl.bind("SUPER + H",      hl.dsp.exec_cmd("hyprpicker -a --format=hex"))
hl.bind("SUPER + N",      hl.dsp.exec_cmd("neovide"))

hl.bind("SUPER + K",         hl.dsp.exec_cmd("wvkbd-mobintl"))
hl.bind("SUPER + SHIFT + K", hl.dsp.exec_cmd("pkill wvkbd"))

hl.bind("SUPER + SHIFT + B", hl.dsp.exec_cmd(S .. "/bluetooth/start.sh"))
hl.bind("SUPER + ALT + B",   hl.dsp.exec_cmd(S .. "/bluetooth/stop.sh"))

hl.bind("Print",         hl.dsp.exec_cmd(S .. "/screenshot/screen.sh"))
hl.bind("SHIFT + Print", hl.dsp.exec_cmd(S .. "/screenshot/area.sh"))

hl.bind("CTRL + SHIFT + R", hl.dsp.exec_cmd("systemctl --user restart waybar"))
hl.bind("CTRL + SHIFT + H", hl.dsp.exec_cmd(S .. "/wallpaper/pick.sh"))

hl.bind("SUPER + left",  hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + right", hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER + up",    hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + down",  hl.dsp.focus({ direction = "down" }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind("SUPER + " .. key,         hl.dsp.focus({ workspace = i}))
    hl.bind("SUPER + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Example special workspace (scratchpad)
hl.bind("SUPER + S",         hl.dsp.workspace.toggle_special("magic"))
hl.bind("SUPER + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind("SUPER + SHIFT + left",  hl.dsp.window.resize({ x = -50, y =  0,  relative = true }))
hl.bind("SUPER + SHIFT + right", hl.dsp.window.resize({ x =  50, y =  0,  relative = true }))
hl.bind("SUPER + SHIFT + up",    hl.dsp.window.resize({ x =  0,  y = -50, relative = true }))
hl.bind("SUPER + SHIFT + down",  hl.dsp.window.resize({ x =  0,  y =  50, relative = true }))

hl.bind("SUPER + CTRL + left",  hl.dsp.window.move({ direction = "left"  }))
hl.bind("SUPER + CTRL + right", hl.dsp.window.move({ direction = "right" }))
hl.bind("SUPER + CTRL + up",    hl.dsp.window.move({ direction = "up"    }))
hl.bind("SUPER + CTRL + down",  hl.dsp.window.move({ direction = "down"  }))

hl.bind("SUPER + ALT + left",  hl.dsp.window.move({ workspace = "-1" }))
hl.bind("SUPER + ALT + right", hl.dsp.window.move({ workspace = "+1" }))

hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("brightnessctl s 1%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 1%-"), { locked = true, repeating = true })

hl.bind("XF86AudioPlay",        hl.dsp.exec_cmd("playerctl play-pause"),                           { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 1%+"), { locked = true, repeating = true })

-- EXTERNAL DAC
-- bind   = ,XF86AudioPlay,        exec, amixer -D hw:Audio set "PCM" toggle
-- bindel = ,XF86AudioLowerVolume, exec, amixer -M -D hw:Audio set "PCM" 1%-
-- bindel = ,XF86AudioRaiseVolume, exec, amixer -M -D hw:Audio set "PCM" 1%+
