{config, ...}: {
  networking = {
    networkmanager.enable = true;
  };
  systemd.services.NetworkManager-wait-online.enable = false; # nixpkgs issue#180175
}
