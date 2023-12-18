{
  pkgs,
  ...
}: {
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
    };
    autoRepeatDelay = 0;
  };
}
