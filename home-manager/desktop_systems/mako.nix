{theme,pkgs, ...}: let
  inherit (theme) xcolors;
in {
  services.mako = {
    enable = true;
    defaultTimeout = 5000;
    font = "HackGen35 Console NFJ";
    borderRadius = 10;
    borderSize = 2;
    backgroundColor = xcolors.bg;
    borderColor = xcolors.fg;
  };
  home.packages = with pkgs; [
    libnotify
  ];

} 