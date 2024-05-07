{pkgs, ...}: {
  imports = [
    ./git.nix
    ./shell
    ./direnv.nix
  ];
  home.packages = with pkgs; [
    neofetch
    eza
    ripgrep
    bat
    doggo
  ];
}
