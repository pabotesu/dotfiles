{pkgs, ...}: {
  home.packages = with pkgs; [
    # editor
    vscode

    # 1password
    _1password
    _1password-gui
  ];
}
