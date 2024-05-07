{
  pkgs,
  ...
}: {
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    displayManager.gdm.wayland = true;
    libinput.enable = true;
  };
  services.displayManager.sessionPackages = [ pkgs.hyprland ];

}
