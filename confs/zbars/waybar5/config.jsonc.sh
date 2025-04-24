{
  "layer": "top",
  "position": "top",
  "height": 0,
  "spacing": 5,
  "modules-left": [
    "power-profiles-daemon",
    "hyprland/workspaces"
  ],
  "modules-center": [
    "hyprland/window"
  ],
  "modules-right": [
    "privacy",
    "backlight",
    "pulseaudio",
    "tray",
    "battery",
    "clock",
    "custom/notification"
  ],
  "power-profiles-daemon": {
    "format": "{icon}",
    "tooltip-format": "Power profile: {profile}\nDriver: {driver}",
    "format-icons": {
      "default": "󰣇"
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
    },
    "format-icons": {
      "active": "󰮯",
      "empty": "",
      "default": ""
    }
  },
  "hyprland/window": {
    "format": "{class} -> {title}",
    "separate-outputs": true,
    "max-length": 64,
    "rewrite": {
      " -> ": "hyprland",
      "kitty -> ~": "kitty"
    }
  },
  "privacy": {
    "icon-size": 11
  },
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
    "format-charging": "{icon} 󱐋{capacity}%",
    "format-plugged": "{icon} 󱐋{capacity}%",
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
  }
}
