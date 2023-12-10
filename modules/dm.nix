{pkgs, ...}: {
  environment.systemPackages = [
    pkgs.lemurs
  ];
}
