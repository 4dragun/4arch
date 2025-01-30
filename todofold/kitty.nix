{ inputs, config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    extraConfig = "
      bold_font               JetBrainsMono NF ExtraBold
      italic_font             JetBrainsMono NF Italic
      bold_italic_font        JetBrainsMono NF ExtraBold Italic
      window_padding_width    7
      confirm_os_window_close 0
    ";
  };
}
