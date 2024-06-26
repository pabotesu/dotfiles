{
  description = " #---# NixOS Configuration for pabotesu #---# ";

  inputs = {
    ### nix and nix-tools
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    flake-utils.url = "github:numtide/flake-utils";
    
    ### home-manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ### hyprland
    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland-contrib = {
      url = "github:hyprwm/contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprpicker = {
      url = "github:hyprwm/hyprpicker";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprsome.url = "github:sopa0/hyprsome";

    ### others systems
    rust-overlay.url = "github:oxalica/rust-overlay";
    xremap.url = "github:xremap/nix-flake";
  
  };

  outputs = inputs: 
    { 
      nixosConfigurations = (import ./hosts inputs).nixos;
      homeConfigurations = (import ./hosts inputs).home-manager;
    } // inputs.flake-utils.lib.eachDefaultSystem (system: let
        pkgs = import inputs.nixpkgs {
          inherit system;
        };
      scripts = with pkgs; [
       (writeScriptBin "switch-home" ''
         home-manager switch --flake ".#$@"
       '')
       (writeScriptBin "switch-nixos" ''
          sudo nixos-rebuild switch --flake ".#$@"
       '')
      ];
    in {
      formatter = pkgs.alejandra;
      devShell = pkgs.mkShell {
        packages = scripts;
      };
    });
}
