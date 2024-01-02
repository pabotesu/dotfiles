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

  home.pointerCursor = 
    let 
      getFrom = url: hash: name: {
          gtk.enable = true;
          x11.enable = true;
          name = name;
          size = 16;
          package = 
            pkgs.runCommand "moveUp" {} ''
              mkdir -p $out/share/icons
              ln -s ${pkgs.fetchzip {
                url = url;
                hash = hash;
              }} $out/share/icons/${name}
          '';
        };
    in
      getFrom 
        "https://github.com/ful1e5/XCursor-pro/releases/download/v2.0.1/XCursor-Pro-Dark.tar.gz"
        "sha256-1sz4lj4awv1qbhxpjndy5cgiggxs2gybbmc5ll3fjz7h486ap7n0"
        "XCursor-Pro-Dark";

  home.file = {
    "screenlock.sh" = {
     target = ".desktop_env/scripts/screenlock.sh";
     source = ./scripts/screenlock.sh;
    };
  };
}
