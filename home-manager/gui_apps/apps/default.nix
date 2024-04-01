{inputs, pkgs, ...}: {
  home.packages = with pkgs; [
    # editor
    vscode

    # note
    obsidian

    # 1password
    _1password
    _1password-gui

    # media player
    gnome.totem # video player
    gnome.evince # pdf viewer
    inputs.syndicationd.packages.${pkgs.system}.default
  ];
  ### media control
  services.easyeffects.enable = true;
  programs.obs-studio.enable = true;
}
