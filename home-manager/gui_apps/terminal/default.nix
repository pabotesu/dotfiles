{theme, ...}: let
  xcolors = theme.xcolors;
in {
  programs.alacritty = {
    enable = true;
      settings = {
        window = {
          opacity = 0.8;
          padding = {
            x = 10;
            y = 10;
          };  
        };
        font = {
          size = 10;
          normal.family = "JetBrainsMono Nerd Font";
        };
        colors = {
          primary = {
            background = xcolors.bg;
            foreground = xcolors.fg;
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
