{pkgs, ...}: {
  imports = [
    ./git.nix
    ./shell
  ];
  home.packages = with pkgs; [
    neofetch
  ];
}
