{pkgs, config, ...}: {
  imports = [
  ./wofi
  ./screen_lock
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
