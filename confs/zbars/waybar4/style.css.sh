* {
    font-family: JetBrainsMono Nerd Font;
    font-weight: bolder;
    font-size: 10pt;
  }
window#waybar { background: #1F2336; }
button {
  border: none;
  border-radius: 0;
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
#custom-notification {
  background: #1A1B26;
  border-radius: 10px;
  padding: 2px 10px;
  margin-top: 5px;
  margin-bottom: 5px;
}
#power-profiles-daemon {
  margin-left: 10px;
  padding: 1px 23px;
}
#power-profiles-daemon.performance {
  color: #1A1B26;
  background-color: #F7768E;
}
#power-profiles-daemon.balanced { color: #FD3B84; }
#power-profiles-daemon.power-saver {
  color: #1A1B26;
  background-color: #9ECE6A;
}
#workspaces button { color: #2AE7FF; }
#power-profiles-daemon,
#workspaces button label {
  font-size: 12pt;
}
#workspaces button.active { color: #FD3A84; }
#workspaces button.empty { color: #A63AFB; }
#window { color: #2AE7FF; }
#privacy { color: greenyellow; }
#backlight{ color: #FD3A84; }
#pulseaudio { color: #24C5F9; }
/* #network { */
/*   color: #7DCFFF; */
  /* background: #30313C; */
/* } */
/* #bluetooth { */
/*   color: #E0AF68; */
  /* background: #30313C; */
/* } */
/* #tray { */
/*   background-color: #1F2336; */
/* } */
#battery { color: #66FF80; }
#battery.charging, #battery.plugged {
  color: #1A1B26;
  background-color: #9ECE6A;
}
#battery.warning:not(.charging) {
  background-color: #E0AF68;
  color: #1A1B26;
}
#battery.critical:not(.charging) {
  background-color: #F7768E;
  color: #1A1B26;
  animation-name: blink;
  animation-duration: 0.5s;
  animation-timing-function: steps(12);
  animation-iteration-count: infinite;
  animation-direction: alternate;
}
@keyframes blink {
  to {
    background-color: transparent;
    color: #F7768E;
  }
}
#clock { color: #FF8700; }
#custom-notification {
  color: #A63AFB;
  margin-right: 10px;
  padding: 0px 23px;
}
