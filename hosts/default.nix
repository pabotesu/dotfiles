inputs: let
  mkNixOS_System = {
    system,
    hostname,
    username,
    modules,
  }:
   inputs.nixpkgs.lib.nixosSystem {
     inherit system modules;
     specialArgs = {
      inherit inputs hostname username;
     };
   };
in {
  nixos = {
    thinkpad_x280 = mkNixOS_System {
      system = "x86_64-linux";
      hostname = "thinkpad_x280";
      username = "pabotesu";
      modules = [
        ./thinkpad_x280/nixos.nix
      ];
    };
  };
}
