{
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
          ### fonts ###
        };
        color = {
          primary = {
            background = 0x1d1f21;
            foreground = 0xc5c8c6;
          };
          normal = {
            0x282a2e black;
            0xcc6666 red;
            0xb5bd68 green;
            0xf0c674 yellow;
            0x81a2be blue;
            0xb294bb magenta;
            0x8abeb7 cyan;
            0xc5c8c6 white;
          };
        };
      };
  };
}
