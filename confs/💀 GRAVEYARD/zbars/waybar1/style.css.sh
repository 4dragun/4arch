* {
    font-family: JetBrainsMono Nerd Font;
    font-weight: bolder;
    font-style: italic;
    font-size: 12px;
  }
window#waybar {
  background-color: #1A1B26;
}
button {
  border: none;
  border-radius: 0;
}
#workspaces button,
#privacy,
#pulseaudio,
#network,
#bluetooth,
#tray,
#battery,
#clock {
  padding: 0 3px;
}
#power-profiles-daemon,
#custom-notification {
  padding: 0 17px;
}
#power-profiles-daemon.performance {
  color: #1A1B26;
  background-color: #F7768E;
}
#power-profiles-daemon.balanced {
  color: pink;
}
#power-profiles-daemon.power-saver {
  color: #1A1B26;
  background-color: #9ECE6A;
}
#workspaces button {
  background-color: transparent;
  color: #F4748C
}
#workspaces button.active {
  color: #F4748C;
  box-shadow: inset 0 -2px #9ECE6A;
}
#workspaces button.empty {
  color: #7DCFFF
}
#window {
  color: #7DCFFF;
}
#privacy {
  color: black;
  background-color: yellowgreen;
}
#pulseaudio {
  color: #BB9AF7;
}
#network {
  color: #7DCFFF;
}
#bluetooth {
  color: #E0AF68;
}
#battery {
  color: #9ECE6A;
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
  color: #F7768E;
}
#custom-notification {
  color: #BB9AF7;
}
