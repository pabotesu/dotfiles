{
  pkgs,
  ...
}: {
  #home.packages = [pkgs.swaylock-effects];
  home.packages = [pkgs.swaylock];
  home.file.".config/swaylock/config".source = ./swaylock.config; 
}
