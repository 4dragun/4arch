* {
    font-family: JetBrainsMono Nerd Font;
    font-weight: bolder;
    font-size: 9pt;
  }
window#waybar {
  background: #1A1B26;
}
button {
  border: none;
  border-radius: 0;
}
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
  padding: 0px 10px;
  border-radius: 10px;
  margin-top: 6px;
  margin-bottom: 6px;
}
#power-profiles-daemon {
  padding: 0 18px;
  border-radius: 10px;
  margin-top: 6px;
  margin-bottom: 6px;
  margin-left: 10px;
}
#power-profiles-daemon.performance {
  color: #1A1B26;
  background-color: #F7768E;
}
#power-profiles-daemon.balanced {
  color: #63FC81;
  background: #1F2336;
}
#power-profiles-daemon.power-saver {
  color: #1A1B26;
  background-color: #9ECE6A;
}
#workspaces {
  background: #1F2336;
}
#workspaces button {
  color: #FF8800;
  /* padding: 0 5px; */
}
#power-profiles-daemon,
#workspaces button label {
  font-size: 12pt;
}
#workspaces button.active {
  color: #FD3A84;
}
#workspaces button.empty {
  color: #25C5F9;
}
#window {
  background: #1F2336;
  color: #FE80FF;
}
#privacy {
  color: #1A1B26;
  background-color: greenyellow;
}
#backlight{
  background: #1F2336;
  color: #FD3A84;
}
#pulseaudio {
  color: #24C5F9;
  background: #1F2336;
}
#network {
  color: #7DCFFF;
  background: #30313C;
}
#bluetooth {
  color: #E0AF68;
  background: #30313C;
}
#tray {
  background-color: #1F2336;
}
#battery {
  color: #9ECE6A;
  background: #30313C;
}
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
#clock {
  color: #FF8700;
  background: #1F2336;
}
#custom-notification {
  color: #A93AFF;
  background: #1F2336;
  margin-right: 10px;
}
