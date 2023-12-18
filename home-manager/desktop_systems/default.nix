{pkgs, config, ...}: {
  imports = [
  ./wofi.nix
  ];
 
  wayland = {
    windowManager.hyprland = {
      enable = true;
      xwayland = {
        enable = true;
      };
    extraConfig = (import "./config/hyprland.config.nix" {
      inherit(config);
      }); 
    };
  };
}
