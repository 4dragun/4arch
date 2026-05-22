local colors = require("hyprland.colors")

hl.config({
    general = {
        gaps_in     = 3,
        gaps_out    = 7,
        border_size = 1,

        col = {
            active_border   = colors.surface_container_high,
            inactive_border = colors.surface_container,
        },

        resize_on_border = true,
        layout           = "dwindle",
    },
    dwindle = { preserve_split = true }
})
