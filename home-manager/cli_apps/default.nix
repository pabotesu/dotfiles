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
  home.file.".ssh/config".source = ./ssh.config;
}
