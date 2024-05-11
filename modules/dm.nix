{
  pkgs,
  ...
}: {
  services.xserver = {
    displayManager.gdm.enable = true;
    displayManager.gdm.wayland = true;
  };
  programs.dconf.enable = true;

  services.displayManager.sessionPackages = [ pkgs.hyprland ];
  services.dbus.enable = true; 

}
