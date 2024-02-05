{pkgs, ...}: {
  home.packages = with pkgs; [
    # editor
    vscode

    # note
    obsidian

    # 1password
    _1password
    _1password-gui
  ];
}