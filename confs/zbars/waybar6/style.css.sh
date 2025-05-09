* {
    font-family: Rubik, JetBrainsMono Nerd Font;
    /* font-weight: bolder; */
    font-size: 11pt;
  }
window#waybar { background: #1A1B26; }
button {
  border: none;
  border-radius: 0;
}
.brightness-icon {
    font-size: 30px;
    margin-right: 6px; /* optional spacing */
}

#power-profiles-daemon,
#workspaces,
#window,
#privacy,
#backlight,
#pulseaudio,
#network,
#bluetooth,
#tray,
#battery,
#clock,
#pulseaudio-slider,
#custom-notification {
  background: #1F2336;
  border-radius: 10pt;
  padding: 3px 10px;
  margin-top: 4px;
  margin-bottom: 4px;
  color: #B4F9F8;
}
#power-profiles-daemon {
  padding: 0px 23px;
}
#power-profiles-daemon.performance {
  color: #1A1B26;
  background-color: #F7768E;
}
/* #power-profiles-daemon.balanced { color: #FD3B84; } */
#power-profiles-daemon.power-saver {
  color: #1A1B26;
  background-color: #9ECE6A;
}
/* #workspaces button label, */
#power-profiles-daemon {
  font-size: 12pt;
}
#workspaces button { color: #B4F9F8;
background-color: #2F3549;
  border-radius: 999pt;
  margin-left: 2px;
  margin-right: 2px;
}
#workspaces button.active {
  color: #1A1B26;
  background: #B4F9F8;
  border-radius: 999pt;
}
#workspaces button.empty { color: #787C99;
background: none;
}
#workspaces button:hover {
    background: #787C99;
  color: #1F2336;
  border-radius: 10pt;
}
#window {
background: #1A1B26;
margin-left: 13px;}
#privacy { color: greenyellow; }
/* #backlight{ color: #FD3A84; } */
/* #pulseaudio { color: #24C5F9; } */
/* #network { */
/*   color: #7DCFFF; */
  /* background: #30313C; */
/* } */
/* #bluetooth { */
/*   color: #E0AF68; */
  /* background: #30313C; */
/* } */
#tray {
  background: #1A1B26;
}
#battery { background: #1A1B26; }
#battery.charging, #battery.plugged {
  color: #1A1B26;
  background-color: #B4F9F8;
}
#battery.warning:not(.charging) {
  background-color: #FF9E64;
  color: #1A1B26;
}
#battery.critical:not(.charging) {
  background-color: #B4F9F8;
  color: #1A1B26;
  animation-name: blink;
  animation-duration: 0.5s;
  animation-timing-function: steps(12);
  animation-iteration-count: infinite;
  animation-direction: alternate;
}
@keyframes blink {
  to {
    background-color: #1A1B26;
    color: #B4F9F8;
  }
}
/* #clock { color: #FF8700; } */
#custom-notification {
  /* color: #A63AFB; */
  background: #1A1B26;
  margin-right: 13px;
}
/* #backlight { */
/*   border-top-right-radius: 0px; */
/*   border-bottom-right-radius: 0px; */
/* } */
/* #backlight-slider { */
/*   min-width: 100pt; */
/*   margin-left: -11pt; */
/*   border-top-left-radius: 0px; */
/*   border-bottom-left-radius: 0px; */
/* } */
/* #backlight-slider slider { */
/*   background: none; */
/*   border: none; */
/*   box-shadow: none; */
/*   min-height: 23pt; */
/* } */
/* #backlight-slider trough { */
/*   border-radius: 999pt; */
/* } */
/* #backlight-slider highlight { */
/*   border-radius: 999pt; */
/*   background: #B4F9F8; */
/* } */
/**/
/* #pulseaudio { */
/*   border-top-right-radius: 0px; */
/*   border-bottom-right-radius: 0px; */
/* } */
/* #pulseaudio-slider { */
/*   min-width: 100pt; */
/*   margin-left: -11pt; */
/*   border-top-left-radius: 0px; */
/*   border-bottom-left-radius: 0px; */
/* } */
/* #pulseaudio-slider slider { */
/*   background: none; */
/*   border: none; */
/*   box-shadow: none; */
/*   min-height: 23pt; */
/* } */
/* #pulseaudio-slider trough { */
/*   border-radius: 999pt; */
/* } */
/* #pulseaudio-slider highlight { */
/*   border-radius: 999pt; */
/*   background: #B4F9F8; */
/* } */
