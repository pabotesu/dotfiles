{pkgs, ...}: {
  imports = [
    ./git.nix
    ./shell
  ];
  home.packages = with pkgs; [
    neofetch
    eza
    ripgrep
    bat
  ];
}
