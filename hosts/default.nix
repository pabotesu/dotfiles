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
        theme = (import ../themes) "iceberg";
        pkgs-stable = import inputs.nixpkgs-stable {
          inherit system overlays;
          config = {
            allowUnfree = true;
          };
        };
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
   
   ### settings nix systems for thinkpad-x280###
   thinkpad-x280 = mkNixOS_System {
      system = "x86_64-linux";
      hostname = "thinkpad-x280";
      username = "pabotesu";
      modules = [
        ./thinkpad-x280/nixos.nix
      ];
    };

   ### settings nix systems for nix-machine###
   nix-machine = mkNixOS_System {
      system = "x86_64-linux";
      hostname = "nix-machine";
      username = "pabotesu";
      modules = [
        ./nix-machine/nixos.nix
      ];
    };
  
  };

  ### settings home-manager ###
  home-manager = {
       
    ### settings home-manager for pabotesu@thinkpad-x280 ###
    "pabotesu@thinkpad-x280" = mkHomeManagerConfiguration {
      system = "x86_64-linux";
      username = "pabotesu";
      overlays = [(import inputs.rust-overlay)];
      modules = [
        ./thinkpad-x280/home-manager.nix
      ];
    };

    ### settings home-manager for pabotesu@nix-machine ###
    "pabotesu@nix-machine" = mkHomeManagerConfiguration {
      system = "x86_64-linux";
      username = "pabotesu";
      overlays = [(import inputs.rust-overlay)];
      modules = [
        ./nix-machine/home-manager.nix
      ];
    };
  
  };

}
