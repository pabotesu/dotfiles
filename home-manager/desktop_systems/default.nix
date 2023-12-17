{pkgs, ...}: {
  imports = [
  ./wofi.nix
  ];
 
wayland = {
  enable = true;
  windowManager.hyprland = {
    enable = true;
    xwayland = true;
    #extraConfig = 
  };
}; 

};
