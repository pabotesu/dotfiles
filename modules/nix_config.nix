{username, ...}: {
  nix = {
    settings = {
      auto-optimise = true;
      experimental-features = ["nix-command" "flakes"];
      trusted-users = ["root" "${username}"];
      accept=flake-config = true;
    };
    gc = {
      automatic = true;
      dates = "weekly";
      optinos = "--delete-older-than 7d";
    };
  };
  nixpkgs.config.allowUnfree = true;
}
