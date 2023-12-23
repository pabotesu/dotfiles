{pkgs, ...}: {
  programs.wofi = {
    enable = true;
  };
}
## app launcher
home.file.".config/wofi/config".source = ./config/wofi.config;
home.file.".config/wofi/style.css".source = ./config/css/style.css;

## power menu
home.file.".config/wofi/powermenu.conf".souce = ./config/powermenu.conf;
home.file.".config/wofi/powermenu.css".source = ./config/css/powermenu.conf;
home.file.".rsc_dir/powermenu.sh".source = ./script/powermenu.sh;