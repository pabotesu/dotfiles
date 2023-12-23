{
  pkgs,
  ...
}: {
  home.packages = [pkgs.swaylock-effects];
  home.file.".config/swaylock/config".source = ./swaylock.config; 
}
