{
  pkgs,
  ...
}: {
  home.packages = [pkgs.swaylock-effects];
  home.file.".config/swaylock/config".text = (import ./config/swaylock.config.nix); 
}
