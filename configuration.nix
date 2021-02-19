



{ config, lib, pkgs, ... }:
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./coregui.nix
      ./corecli.nix
    ];
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    extraModulePackages = [config.boot.kernelPackages.rtl8821ce];  #drivers for network card
  };
  networking = {
    hostName = "nixos";
    wireless.enable = false;#handled by network manager
    networkmanager.enable = true;
    useDHCP = false;
    interfaces.enp0s21f0u1.useDHCP = false;
    interfaces.enp0s21f0u2.useDHCP = false; 
    interfaces.enp0s21f0u3.useDHCP = false;
  };
  sound.enable = true;
  hardware = {
    pulseaudio = {
      enable = true;
      package = pkgs.pulseaudioFull;
    };
    bluetooth.enable = true;
  };
  time.timeZone = "America/New_York";
  users = {
    mutableUsers = true;
    users = {
      david = {
        isNormalUser = true;
        password = "";
        extraGroups = ["wheel" "networkmanager"];
      };
    };
    extraUsers.david.shell = pkgs.fish;
  };
  security.sudo.wheelNeedsPassword = false;
  nixpkgs.config.allowUnfree = true;
  programs = {
    fish = {
      enable = true;
      #shellAliases = [e];
    };
  };
  services.openssh = {
    enable = true;
  };
  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
  services.unclutter-xfixes = {
    enable = true;
    extraOptions = ["ignore-scrolling"];
  };
  system.stateVersion = "20.09";
}
