{pkgs, config, ...}: {
  imports = [
  ./wofi
  ./screen_lock
  ./status_bar 
  ./xdg.nix
  ./gtk.nix
  ./mako.nix
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
