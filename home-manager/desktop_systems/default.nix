{inputs, pkgs, config, theme, ...}: {
  imports = [
  ./launcher
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
    wob
    swaybg
    swayidle
    inputs.hyprland-contrib.packages.x86_64-linux.grimblast
    inputs.hyprpicker.packages.x86_64-linux.hyprpicker
    wl-clipboard
    brightnessctl
    pamixer
    playerctl
    feh
    clipman
    wdisplays
    wireplumber
    slurp
    xwaylandvideobridge
    copyq
    cliphist 
  ]    
  ++ [
      inputs.hyprsome.packages.${pkgs.system}.default # workspace manager
    ];


  home.file = {
    "wallpaper.jpg" = {
      target = ".desktop_env/scripts/wallpaper.jpg";
      source = pkgs.fetchurl {
        url = "https://imgur.com/PhdhH.jpg";
        sha256 = "sha256-lOFjG06Qq6KzERz3/OQp40oIsBhhgy9s8MBMpbyYTWY=";
      };
    };
    "screenlock.sh" = {
     target = ".desktop_env/scripts/screenlock.sh";
     source = ./scripts/screenlock.sh;
    };
  };

  wayland = {
    windowManager.hyprland = {
      enable = true;
      extraConfig = import ./config/hyprland.config.nix {};
    };
  };

}
