* {
    font-family: JetBrainsMono Nerd Font;
    font-weight: bolder;
    font-style: italic;
    font-size: 12px;
  }
#workspaces button,
#privacy,
#backlight,
#pulseaudio,
#network,
#bluetooth,
#tray,
#battery,
#clock {
  padding: 0 3px;
}
window#waybar { background: none; }
button {
  border: none;
  border-radius: 0;
}
#power-profiles-daemon,
#custom-notification {
  padding: 0 13px;
}
#power-profiles-daemon {
  color: #1A1B26;
  background: linear-gradient(to right, #09B092, #55F083);
}
#workspaces {
  background: linear-gradient(to right, #055CD3, #24C2F8)
}
#workspaces button {
  /* background-color: #363943; */
  color: white
}
#workspaces button.active {
  color: white;
  box-shadow: inset 0 -2px white;
}
#workspaces button.empty { color: black }
#window {
  color: #1A1B26;
  background: linear-gradient(to right, #AD3EFF, #FC7EFF);
  border-bottom-right-radius: 9px;
  border-top-right-radius: 9px;
  padding-right: 12px;
}
#privacy { color: greenyellow; }
#backlight {
  color: #1A1B26;
  background: linear-gradient(to right, #FD4385, #FFA18D);
}
#pulseaudio {
  color: #1A1B26;
  background: linear-gradient(to right, #5576FF, #4EC2FF);
}
#network {
  color: #1A1B26; 
  background: linear-gradient(to right, #AE3EFF, #FA7DFF);
}
#bluetooth {
  color: #1A1B26;
  background: linear-gradient(to right, #07AE92, #53EE84);
}
#tray {
  background: none;
}
#battery {
  color: #1A1B26;
  background: linear-gradient(to right, #FF3C00, #FF9500);
}
#battery.critical:not(.charging) {
  animation-name: blink;
  animation-duration: 0.5s;
  animation-timing-function: steps(12);
  animation-iteration-count: infinite;
  animation-direction: alternate;
}
@keyframes blink {
  to {
    color: white;
  }
}
#clock {
  color: #1A1B26;
  background: linear-gradient(to right, #5477FF, #4EC2FF);
}
#custom-notification {
  color: #1A1B26;
  background: linear-gradient(to right, #AF3FFF, #F77AFF);
}
#custom-po2,
#custom-wo1, #custom-wo2, #custom-wi1, #custom-wi2,
#custom-pr1, #custom-pr2, #custom-br1, #custom-br2,
#custom-pu1, #custom-pu2, #custom-ne1, #custom-ne2,
#custom-bl1, #custom-bl2, #custom-ba1, #custom-ba2,
#custom-cl1, #custom-cl2, #custom-no1 {
  font-size: 12pt;
  margin-top: -1px;
}
#custom-po2 { color: #55F083; }
#custom-po2, #custom-wo1 { background: #0662D5; }
#custom-wo1 { color: #055DD3; }
#custom-wo2 { color: #23C1F8; }
#custom-wo2, #custom-wi1 { background: #AD3DFF; }
#custom-wi1, #custom-wi2 { color: #AD3DFF; }
#custom-br1 { color: #FD4185; }
#custom-br2 { color: #FF9A8C; }
#custom-br2, #custom-pu1 { background: #FF9A8C; }
#custom-pu1 { color: #5574FF; }
#custom-pu2 { color: #4EC1FF; }
#custom-pu2, #custom-ne1 { background: #AD3DFF; }
#custom-ne1 { color: #AD3DFF; }
#custom-ne2 { color: #FA7DFF; }
#custom-ne2, #custom-bl1 { background: #07AE92; }
#custom-bl1 { color: #07AE92; }
#custom-bl2 { color: #53EE84; }
/* #custom-bl2, #custom-ba1 { background: #2F3549; } */
#custom-ba1 { color: #FF3C00; }
#custom-ba2 { color: #FF9500; }
#custom-ba2, #custom-cl1 { background: #5477FF; }
#custom-cl1 { color: #5477FF; }
#custom-cl2 { color: #4EC2FF; }
#custom-cl2, #custom-no1 { background: #4EC2FF; }
#custom-no1 { color: #AF3FFF; }
