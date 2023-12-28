{
  pkgs,
  ...
}: {
  services.xserver = {
    displayManager ={
      lightdm = {
        greeters.mini = {
         enable = false;
         user = "pabotesu";
         extraConfig = ''
                [greeter]
                show-password-label = true
                [greeter-theme]
                #background-image = ""
         '';
        };
      };
      defaultSession = "pkgs.hyprland";
monitor= , 1920x1080@60, 0x0, 1
    };
    desktopManager = {
      session = [
        {
          name = "nix-hyprland";
          start = ''
            Hyprland &
            waitPID=$!
          '';
        }
      ];
    };
  };
}
