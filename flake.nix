{
  description = " #---# NixOS Configuration for pabotesu #---# ";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    flakes-utils.url = "github:numtide/flake-utils";
  };

  outputs = inputs:
  { 
   nixosConfigurations = (import ./hosts inputs).nixos;
  };
}
