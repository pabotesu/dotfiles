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
        colors = {
          primary = {
            background = "0x1d1f21";
            foreground = "0xc5c8c6";
          };
          normal = {
            black   = "0x282a2e";
            red     = "0xcc6666";
            green   = "0xb5bd68";
            yellow  = "0xf0c674";
            blue    = "0x81a2be";
            magenta = "0xb294bb";
            cyan    = "0x8abeb7";
            white   = "0xc5c8c6";
          };
        };
      };
  };
}
