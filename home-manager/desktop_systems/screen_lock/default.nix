{
  pkgs,
  ...
}: {
  home.packages  =with pkgs;[
    hyprlock
    hypridle
  ];
  home.file.".config/hypr/hyprlock.conf".source = ./hyprlock.config; 
  home.file.".config/hypr/hypridle.conf".source = ./hypridle.config; 
}
