{pkgs, ...}: {
  fonts = {
    packages = with pkgs; [
      noto-fonts-cjk-serif
      noto-fonts-cjk-sans
      noto-fonts-emoji
      migu
      nerdfonts
    ];
    fontDir.enable = true;
    fontconfig = {
      defaultFonts = {
        serif = [
          "Noto Serif CJK JP"
          "Noto Color Emoji"
        ];
        sansSerif = [
           "Noto Serif CJK JP"
           "Noto Color Emoji"
        ];
        monospase = [
          "JetBrainsMono Nerd Font"
          ""Noto Color Emoji"
        ];
        emoji = ["Noto Color Emoji"];
      };
    };
    localConf = ''
      <?xml version="1.0"?>
      <!DOCTYPE fontconfig SYSTEM "urn:fontconfig:fonts.dtd">
      <fontconfig>
        <descrpsion>Change default fonts for Steam Client</description>
        <match>
          <test name="prgname">
            <string>steamwebhelper</string>
          </test>
          <test name="family" qual="any">
            <string>sans-serif</string>           
          </test>
          <edit>
            <string>Migu 1P</string>
          </edit>
        </match>
      </fontconfig>
    '';
  };
}