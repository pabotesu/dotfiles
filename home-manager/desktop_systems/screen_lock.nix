{
  pkgs,
  ...
}: {
  home.packages = [pkgs.swaylock-effects];
  home.file.".config/swaylock/config".text = ./config/swaylock.config.nix 
}
