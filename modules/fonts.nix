{pkgs, ...}: {
  fonts = {
    packages = with pkgs; [
      noto-fonts-cjk-serif
      noto-fonts-cjk-sans
      noto-fonts-emoji
      migu
      nerdfonts
    ];
    
  };
}