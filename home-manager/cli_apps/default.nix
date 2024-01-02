{pkgs, ...}: {
  imports = [
    ./git.nix
    ./shell
  ];
  users.users.pabotesu.shell = pkgs.zsh;
  home.packages = with pkgs; [
    neofetch
  ];
}
