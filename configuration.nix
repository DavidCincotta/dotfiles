#   _       _________          _______  _______                                              
#  ( (    /|\__   __/|\     /|(  ___  )(  ____ \                                             
#  |  \  ( |   ) (   ( \   / )| (   ) || (    \/                                             
#  |   \ | |   | |    \ (_) / | |   | || (_____                                              
#  | (\ \) |   | |     ) _ (  | |   | |(_____  )                                             
#  | | \   |   | |    / ( ) \ | |   | |      ) |                                             
#  | )  \  |___) (___( /   \ )| (___) |/\____) |                                             
#  |/    )_)\_______/|/     \|(_______)\_______)  

# main config file
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
      
      # alias se="sudo vim -n -u /etc/nixos/vimconfig.dotfile";
      enable = true;
      interactiveShellInit = ''
        alias gs="git status";
        alias e="vim -n";
        alias s="sudo";
        alias se="sudo vim -n";
        alias l="ls -ahl";
        alias g="grep -P";
	alias h="history --show-time="(%Y-%m-%d) - %H:%M.%S    "";
        alias ontouchpad="xinput enable 11";
	alias offtouchpad="xinput disable 11";
        alias rebuild="sudo nixos-rebuild switch";
        alias ctrlc="xclip -selection c";
        alias ctrlv="xclip -selection c -o";
	alias p="ps -A";
	alias gpom="git push -u origin master";
	alias gs="git status";
	alias f="fish";
        alias sf="sudo fish";
        alias lynx="lynx -cfg=/etc/nixos/lynx.cfg";
      '';
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
