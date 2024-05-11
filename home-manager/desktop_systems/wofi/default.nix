{pkgs, ...}: {
home.packages = with pkgs; [wofi wofi-emoji];

## app launcher
home.file.".config/wofi/config".source = ./config/wofi.config;
home.file.".config/wofi/style.css".source = ./config/css/style.css;
home.file.".rsc_dir/my_wofi.sh".source = ./script/my_wofi.sh;

## power menu
home.file.".config/wofi/powermenu.config".source = ./config/powermenu.config;
home.file.".config/wofi/powermenu.css".source = ./config/css/powermenu.css;
home.file.".rsc_dir/powermenu.sh".source = ./script/powermenu.sh;
}
