{
  services.xserver = {
    displayManager ={
      lightdm = {
        greeters.mini = {
         enable = true;
         user = "pabotesu";
         extraConfig = ''
                [greeter]
                show-password-label = true
                [greeter-theme]
                #background-image = ""
         '';
        };
      };
      defaultSession = "hyprland";
    };
    services.xserver = {
      desktopManager = {
        session = [
          {
            manage = "desktop";
            name = "hyprland";
            start = ''
              Hyprland &
              waitPID=$!
            '';
          }
        ];
      };
    };
  };
}
