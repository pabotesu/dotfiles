{inputs, pkgs, ...}: {
  home.packages = with pkgs; [
    
    # editor
    vscode

    # note
    obsidian

    # 1password
    _1password
    _1password-gui

    # media player
    totem # video player
    evince # pdf viewer
  
    
    # file manager
    xfce.thunar

    # default terminal
    kitty

  ];
  ### media control
  services.easyeffects.enable = true;
  programs.obs-studio.enable = true;

  ### force wayland apps
  home.file.".config/electron-flags.conf".text = ''
    --enable-features=UseOzonePlatform 
    --ozone-platform=wayland
    --enable-wayland-ime
    --gtk-version=4
  '';
  
  home.file.".config/code-flags.conf".text = ''
    --enable-features=UseOzonePlatform 
    --ozone-platform=wayland
    --enable-wayland-ime
    --force-device-scale-factor=2
    --gtk-version=4
  '';
}
