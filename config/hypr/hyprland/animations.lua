hl.config({ animations = { enabled = true, }, })

hl.curve("easeOutQuint", { type = "bezier", points = { {0.22, 1},    {0.36, 1}    } })
hl.curve("easeOutBack",  { type = "bezier", points = { {0.34, 1.56}, {0.64, 1}    } })

hl.animation({ leaf = "global",        enabled = true,  speed = 10, bezier = "default" })
hl.animation({ leaf = "border",        enabled = false })

hl.animation({ leaf = "windows",       enabled = true,  speed = 5, bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsIn",     enabled = true,  speed = 7, bezier = "easeOutBack", style = "popin 90%" })
hl.animation({ leaf = "windowsOut",    enabled = true,  speed = 5, bezier = "default" })

hl.animation({ leaf = "fadeIn",        enabled = false })
hl.animation({ leaf = "fadeOut",       enabled = true,  speed = 5, bezier = "default" })
hl.animation({ leaf = "fade",          enabled = false })

hl.animation({ leaf = "layers",        enabled = false })
hl.animation({ leaf = "layersIn",      enabled = true,  speed = 5, bezier = "easeOutQuint", style = "popin 90%" })
hl.animation({ leaf = "layersOut",     enabled = true,  speed = 5, bezier = "default" })

hl.animation({ leaf = "fadeLayersIn",  enabled = true,  speed = 1, bezier = "default" })
hl.animation({ leaf = "fadeLayersOut", enabled = true,  speed = 5, bezier = "default" })

hl.animation({ leaf = "workspaces",    enabled = false })
hl.animation({ leaf = "workspacesIn",  enabled = true,  speed = 4, bezier = "default", style = "slide" })
hl.animation({ leaf = "workspacesOut", enabled = true,  speed = 4, bezier = "default", style = "slide" })

hl.animation({ leaf = "zoomFactor",    enabled = true,  speed = 17, bezier = "default" })
