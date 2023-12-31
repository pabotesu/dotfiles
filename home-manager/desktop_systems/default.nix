{inputs, pkgs, config, theme, ...}: {
  imports = [
  ./wofi
  ./screen_lock
  ./status_bar 
  ./xdg.nix
  ./gtk.nix
  ./mako.nix
  ];
 home.packages = with pkgs; [
    # Wayland utility
    wtype
    wev
    wayvnc

    swaybg
    swayidle
    inputs.hyprland-contrib.packages.x86_64-linux.grimblast
    inputs.hyprpicker.packages.x86_64-linux.hyprpicker
    wl-clipboard
    brightnessctl
    pamixer
    playerctl
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
