hl.window_rule({
    -- Fix some dragging issues with XWayland
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

hl.window_rule({
    -- for web browser
    name  = "browser-file-picker",
    match = {
        class = "org.freedesktop.impl.portal.desktop.kde",
        float = true,
    },

    size   = {1200, 750},
    center = true,
})

hl.window_rule({ match = { class = "clipse" },               float = true, size = { 800,  650 } })
hl.window_rule({ match = { class = "nwg-look" },             float = true, size = { 800,  500 } })
hl.window_rule({ match = { class = "pavucontrol-qt" },       float = true, size = { 900,  500 } })
hl.window_rule({ match = { class = "blueman-manager" },      float = true, size = { 800,  500 } })
hl.window_rule({ match = { class = "Yad" },                  float = true, size = { 1100, 750 } })
hl.window_rule({ match = { class = "org.kde.kdialog" },      float = true, size = { 1200, 750 } })
hl.window_rule({ match = { class = "kdesystemsettings" },    float = true                       })
hl.window_rule({ match = { class = "nm-connection-editor" }, float = true                       })

-- windowrule = match:class speed.exe,  fullscreen on, content game
-- windowrule = match:class gta_sa.exe, fullscreen on, content game
