{pkgs, ...}: {
  imports = [
  ./wofi.nix
  ];
 
  wayland = {
    windowManager.hyprland = {
      enable = true;
      xwayland = {
        enable = true;
      };
      extraConfig = ( import ./config/hyprland.nix {
      	inherit (config);
      });
    };
  }; 
}
