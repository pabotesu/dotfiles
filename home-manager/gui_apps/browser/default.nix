{
  programs = {
    vivaldi = {
      enable = true;
      commandLineArgs = [
        "--enable-wayland-ime"
        "--enable-features=WebUIDarkMode"
        "--force-dark-mode"
        ];
    };
    brave = {
      enable = true;
      commandLineArgs = [
        "--enable-wayland-ime"
        "--enable-features=WebUIDarkMode"
        "--force-dark-mode" 
        "--incognito"
        ];
    };
    firefox = {
      enable = true;
    };

  };
}
