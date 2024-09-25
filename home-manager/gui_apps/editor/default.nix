{
  programs = {
      vscode = {
        enable = true;
        commandLineArgs = [
          "--enable-wayland-ime"
          "--enable-features=UseOzonePlatform"
          "--ozone-platform=wayland"
        ];
      };
  };
}
