{
  "layer": "top",
  "position": "top",
  "height": 0,
  "spacing": 0,
  "modules-left": [
    "power-profiles-daemon",
    "custom/po2",
    "custom/wo1",
    "hyprland/workspaces",
    "custom/wo2",
    "custom/wi1",
    "hyprland/window"
    // "custom/wi2"
  ],
  "modules-right": [
    "privacy",
    "custom/br1",
    "backlight",
    "custom/br2",
    "custom/pu1",
    "pulseaudio",
    "custom/pu2",
    "custom/ne1",
    "network",
    "custom/ne2",
    "custom/bl1",
    "bluetooth",
    "custom/bl2",
    "tray",
    "custom/ba1",
    "battery",
    "custom/ba2",
    "custom/cl1",
    "clock",
    "custom/cl2",
    "custom/no1",
    "custom/notification"
  ],
  "power-profiles-daemon": {
    "format": "{icon}",
    "tooltip-format": "Power profile: {profile}\nDriver: {driver}",
    "format-icons": {
      "performance": "",
      "balanced": "󰣇",
      "power-saver": ""
    }
  },
  "hyprland/workspaces": {
    "format": "{name}",
    "on-click": "activate",
    "sort-by-number": true,
    "all-outputs": true,
    "show-special": true,
    "special-visible-only": true,
    "persistent-workspaces": {
      "1": [],
      "2": [],
      "3": [],
      "4": [],
      "5": [],
      "6": [],
      "7": [],
      "8": [],
      "9": [],
      "10": []
    }
  },
  "hyprland/window": {
    "format": "{class} -> {title}",
    "separate-outputs": true,
    "rewrite": {
      " -> ": "hyprland",
      "kitty -> ~": "kitty"
    }
  },
  "privacy": { "icon-size": 14 },
  "backlight": {
    "format": "{icon} {percent}%",
    "format-icons": ["󰽤", "", "", "", "", "", "", "", "", ""]
  },
  "pulseaudio": {
    "format-bluetooth": "{icon} {volume}% {format_source}",
    "format-bluetooth-muted": "{icon}   {format_source}",
    "format": "{icon} {volume}% {format_source}",
    "format-muted": " {format_source}",
    "format-source": " {volume}%",
    "format-source-muted": "",
    "format-icons": {
      "headphone": "",
      "hands-free": "",
      "headset": "",
      "phone": "",
      "portable": "",
      "car": "",
      "default": ["", "", ""]
    },
    "on-click": "pavucontrol"
  },
  "network": {
    "format-wifi": "  {essid}",
    "format-ethernet": "{ipaddr}/{cidr} ",
    "tooltip-format": "{ifname} via {gwaddr} ",
    "format-linked": "{ifname} (No IP) ",
    "format-disconnected": "  Disconnected",
    "format-alt": "{ifname}: {ipaddr}/{cidr}",
    "max-length": 10
  },
  "bluetooth": {
    "on-click": "blueman-manager",
    "format": "󰂲 {status}",
    "format-on": "󰂳 {status}",
    "format-connected": "󰂰 {status}",
    "format-disabled": " error",
    "tooltip-format": "{device_alias}({device_battery_percentage}%)",
    "max-length": 10
  },
  "tray": {
    "spacing": 7,
    "icon-size": 16,
    "show-passive-items": true
  },
  "battery": {
    "states": {
      "warning": 30,
      "critical": 20
    },
    "format": "{icon} {capacity}%",
    "format-full": "{icon} {capacity}%",
    "format-charging": "{icon} 󱐋{capacity}% (CHARGING)",
    "format-plugged": "{icon} 󱐋{capacity}% (PLUGGED)",
    "format-warning": "{icon}  {capacity}% (CONSIDER PLUGGING IN THIS SHYIT!)",
    "format-critical": "{icon} 󰚌 {capacity}% (SHYIT IS ABOUT TO DIE!)",
    "format-alt": "{icon} {time}",
    "format-icons": ["", "", "", "", ""]
  },
  "clock": {
    "format": " {:%a %b %d %R}",
    "tooltip-format": "<tt><small>{calendar}</small></tt>"
  },
  "custom/notification": {
    "format": "{icon}",
    "format-icons": {
      "notification": "<span foreground='red'><sup></sup></span>",
      "none": "",
      "dnd-notification": "<span foreground='red'><sup></sup></span>",
      "dnd-none": "",
      "inhibited-notification": "<span foreground='red'><sup></sup></span>",
      "inhibited-none": "",
      "dnd-inhibited-notification": "<span foreground='red'><sup></sup></span>",
      "dnd-inhibited-none": ""
    },
    "return-type": "json",
    "exec-if": "which swaync-client",
    "exec": "swaync-client -swb",
    "on-click": "swaync-client -t -sw",
    "on-click-right": "swaync-client -d -sw",
    "escape": true
  },
  "custom/po2": { "format": "" },
  "custom/wo1": { "format": "" },
  "custom/wo2": { "format": "" },
  "custom/wi1": { "format": "" },
  "custom/wi2": { "format": "" },
  "custom/pr1": { "format": "" },
  "custom/pr2": { "format": "" },
  "custom/br1": { "format": "" },
  "custom/br2": { "format": "" },
  "custom/pu1": { "format": "" },
  "custom/pu2": { "format": "" },
  "custom/ne1": { "format": "" },
  "custom/ne2": { "format": "" },
  "custom/bl1": { "format": "" },
  "custom/bl2": { "format": "" },
  "custom/ba1": { "format": "" },
  "custom/ba2": { "format": "" },
  "custom/cl1": { "format": "" },
  "custom/cl2": { "format": "" },
  "custom/no1": { "format": "" }
}
