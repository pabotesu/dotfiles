{pkgs, config, ...}: {
  imports = [
  ./wofi.nix
  ./screen_lock.nix
  ];
 
  wayland = {
    windowManager.hyprland = {
      enable = true;
      xwayland = {
        enable = true;
      };
    extraConfig = import ./config/hyprland.config.nix {}; 
    };
  };
}
