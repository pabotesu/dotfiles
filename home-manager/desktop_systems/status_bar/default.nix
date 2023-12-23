{pkgs, ...}: {
  programs.waybar = {
    enable = true;
    configDir = ./config;
  };
}
