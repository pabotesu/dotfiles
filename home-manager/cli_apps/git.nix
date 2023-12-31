{pkgs, ...}: {
  programs.git = {
    enable = true;
    userName = "pabotesu";
    userEmail = "pab0te2u@gmail.com";
  };

  home.packages = with pkgs; [
    nodePackages.gitmoji-cli
  ];
}