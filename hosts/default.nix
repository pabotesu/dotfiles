inputs: let
  mkNixSystem = {
    system,
    hostname,
    username,
    modules,
  }:
   inputs.nixpkgs.lib.nixosSystems {
     inherit system modules;
     specialArgs = {
      inherit inputs hostname username;
     };
   };



in {
  nixos = {
    thinkpad_x280 = {
      system = "x86_64-linux";
      hostname = "thinkpad_x280";
      username = "pabotesu";
      modules = [
        ./thinkpad_x280/nixos.nix
      ];
    };
  };
}
