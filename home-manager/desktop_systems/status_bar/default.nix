{pkgs, ...}: {
  programs.waybar-mpris = {
    enable = true;
  };
  home.file.".config/waybar/config".source = ./config/waybar.config;
  home.file.".config/waybar/style.css".source = ./config/style.css;
}
