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
     extraConfig = "./config/hyprland.conf"; 
    };
  }; 
}
