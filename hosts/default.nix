inputs: let

### make nix systems ###
  mkNixOS_System = {
    system,
    hostname,
    username,
    modules,
  }: inputs.nixpkgs.lib.nixosSystem {
     inherit system modules;
     specialArgs = {
      inherit inputs hostname username;
     };
   };

### make users home files ###
  mkHomeManagerConfiguration = {
    system,
    username,
    overlays,
    modules,
  }: inputs.home-manager.lib.homeManagerConfiguration {
      pkgs = import inputs.nixpkgs {
        inherit system overlays;
        config.allowUnfree = true;
      };
      extraSpecialArgs = {
        inherit inputs username;
        theme = (import ../themes) "tokyonight-moon";
      };
      modules =
        modules
        ++ [
          {
            home = {
              inherit username;
              homeDirectory = "/home/${username}";
              stateVersion = "22.11";
            };					
            programs.home-manager.enable = true;
          }
        ];
    };

### setting any my_hosts ###
in {

  ### settings nix systems###
  nixos = {
   
   ### settings nix systems for thinkpad_x280###
   thinkpad_x280 = mkNixOS_System {
      system = "x86_64-linux";
      hostname = "thinkpad_x280";
      username = "pabotesu";
      modules = [
        ./thinkpad_x280/nixos.nix
      ];
    };

  };

  ### settings home-manager ###
  home-manager = {
       
    ### settings home-manager for pabotesu@thinkpad_x280 ###
    "pabotesu@thinkpad_x280" = mkHomeManagerConfiguration {
      system = "x86_64-linux";
      username = "pabotesu";
      overlays = [(import inputs.rust-overlay)];
      modules = [
        ./thinkpad_x280/home-manager.nix
      ];
    };

  };

}
