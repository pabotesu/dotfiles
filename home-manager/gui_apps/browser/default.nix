{
  programs = {
    vivaldi = {
      enable = true;
      commandLineArgs = ["--enable-features=WebUIDarkMode" "--force-dark-mode" "--gtk-version=4"];
    };
    brave = {
      enable = true;
      commandLineArgs = ["--enable-features=WebUIDarkMode" "--force-dark-mode" "--incognito" "--gtk-version=4"];
    };
    firefox = {
      enable = true;
    };

  };
}
