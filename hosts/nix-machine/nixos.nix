# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ 
  inputs,
  pkgs,
  hostname,
  username, 
  ...
}: {
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      
      ../../modules/nix_config.nix
      ../../modules/i18n.nix
      ../../modules/networking.nix
      ../../modules/xserver.nix
      ../../modules/wm.nix
      ../../modules/dm.nix
      ../../modules/fcitx5.nix

    ]
    ++ (with inputs.nixos-hardware.nixosModules; [
      common-cpu-amd
      common-gpu-amd
      common-pc-ssd
    ]);

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    kernelPackages = pkgs.linuxPackages_xanmod_latest;
  };

  networking.hostName = hostname; 

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.pabotesu = {
    isNormalUser = true;
    description = "pabotesu";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };
  
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
   vim
   wget
   git
   bottom
  ];

  # enable ssh
  services.openssh.enable = true; 

  # Did you read the comment?
  system.stateVersion = "23.05";
}

