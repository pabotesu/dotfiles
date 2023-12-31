{theme, ...}: let
  xcolors = theme.xcolors;
in {
  programs.alacritty = {
    enable = true;
      settings = {
        window = {
          padding = {
            x = 10;
            y = 10;
          };  
        };
        font = {
          size = 12;
          normal.family = "JetBrainsMono Nerd Font";
        };
        colors = {
          primary = {
            background = xcolors.bg;
            foreground = xcolors.bg;
          };
          normal = {
            inherit (xcolors) black;
            inherit (xcolors) red;
            inherit (xcolors) green;
            inherit (xcolors) yellow;
            inherit (xcolors) blue;
            inherit (xcolors) magenta;
            inherit (xcolors) cyan;
            inherit (xcolors) white;
          };
        };
      };
  };
}
