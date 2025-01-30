{ inputs, config, pkgs, ...}:

{
  programs.fish = {
    enable = true;
    shellInit = "
      if uwsm check may-start
        exec uwsm start hyprland-uwsm.desktop
      end
      set -U fish_greeting
      # oh-my-posh init fish | source
    ";
    shellAliases = {
      "ls"  = "lsd";
      "cat" = "bat";
      "y"   = "yazi";
      "g"   = "~/4nix/scriptz/g.sh";
      "gp"  = "~/4nix/scriptz/gp.sh";
      "b"   = "~/4nix/scriptz/b.sh";
      "h"   = "~/4nix/scriptz/h.sh";
      "u"   = "h && nh os switch -a";
      "uf"  = "h && nh os switch -u -a";
      "c"   = "nh clean all";
    };
  };
}
