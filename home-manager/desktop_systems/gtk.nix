{pkgs, ...}: {
  home.pointerCursor = 
    let 
      getFrom = url: hash: name: {
          gtk.enable = true;
          #x11.enable = true;
          name = name;
          size = 16;
          package = 
            pkgs.runCommand "moveUp" {} ''
              mkdir -p $out/share/icons
              ln -s ${pkgs.fetchzip {
                url = url;
                hash = hash;
              }} $out/share/icons/${name}
          '';
        };
    in
      getFrom 
        "https://github.com/ful1e5/XCursor-pro/releases/download/v2.0.1/XCursor-Pro-Dark.tar.gz"
        "sha256-wJ6rDCLwfOkGpYXVtfwTur8XHyu+WXk7XDhsroik5Os="
        "XCursor-Pro-Dark";

  gtk = {
    enable = true;
    theme = {
      package = pkgs.flat-remix-gtk;
      name = "Flat-Remix-GTK-Blue-Dark";
    };
    iconTheme = {
      package = pkgs.gnome.adwaita-icon-theme;
      name = "Adwaita";
    };


    # enable dark theme for all gtk applications
    #gtk2.extraConfig = ''
    #  gtk-application-prefer-dark-theme = true
    #'';
    #gtk3.extraConfig = {
    #  gtk-application-prefer-dark-theme = true;
    #};
    #gtk4.extraConfig = {
    #  gtk-application-prefer-dark-theme = true;
    #};
  };
}