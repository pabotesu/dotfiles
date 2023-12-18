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
    };
  };
  home.file = {
    ".config/hypr/hyprland.conf".text = (import ./config/hyprland-config.nix);
  }; 
}
