{
  pkgs,
  ...
}: {
  #home.packages = [pkgs.swaylock-effects];
  home.packages = [pkgs.swaylock];
  #home.packages = [pkgs.swaylock-fancy];
  home.file.".config/swaylock/config".source = ./swaylock.config; 
}
