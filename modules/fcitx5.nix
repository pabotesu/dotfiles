{pkgs, ...}: {
  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx.engines = with pkgs.fcitx-engines; [ mozc ];
    fcitx5.addons = with pkgs; [fcitx5-mozc fcitx5-gtk];
  };
}