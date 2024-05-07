{
  pkgs,
  ...
}: {
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    displayManager.gdm.wayland = true;
  };
    
  services.libinput.enable = true;
  services.displayManager.sessionPackages = [ pkgs.hyprland ];

}
