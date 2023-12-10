{ username, ... }: {
  services.xserver = {
    displayManager = {
      lightdm.greeters.mini = {
        enable = true;
        user = username;
        extraConfig = ''
            [greeter]
            show-password-label = false
            [greeter-theme]
            background-image = ""
        '';
      };
    };
  };
}
