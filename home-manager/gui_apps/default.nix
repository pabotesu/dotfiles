{pkgs, ...}: {
  imports = [
    ./terminal
    ./apps
    ./browser
    ./1password
  ];
}
