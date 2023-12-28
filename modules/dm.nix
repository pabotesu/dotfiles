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
      defaultSession = "pabotesu-hyprland";
    };
    desktopManager = {
      session = [
        {
          name = "nix-hyprland";
          start = ''
            ${pkgs.runtimeShell} Hyprland &
            waitPID=$!
          '';
        }
      ];
    };
  };
}
