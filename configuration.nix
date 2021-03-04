#
#    ooooo      ooo  o8o                .oooooo.    .oooooo..o 
#    `888b.     `8'  `"'               d8P'  `Y8b  d8P'    `Y8 
#     8 `88b.    8  oooo  oooo    ooo 888      888 Y88bo.      
#     8   `88b.  8  `888   `88b..8P'  888      888  `"Y8888o.  
#     8     `88b.8   888     Y888'    888      888      `"Y88b 
#     8       `888   888   .o8"'88b   `88b    d88' oo     .d8P 
#    o8o        `8  o888o o88'   888o  `Y8bood8P'  8""88888P'  
#                                                              
#                                                              
#                                                              
# main config file
{ config, lib, pkgs, ... }:
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./coregui.nix
      ./corecli.nix
      ./service.nix
      #./fetch.nix
      #./python.nix
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
    wireless.enable = false; # handled by network manager, wifi didn't work on true;
    networkmanager.enable = true;
    useDHCP = false;
    #interfaces.enp0s21f0u1.useDHCP = false; # for ethernet usage through USB-C
    interfaces.enp0s21f0u2.useDHCP = true; 
    #interfaces.enp0s21f0u3.useDHCP = false;
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
  location = {
    #https://www.latlong.net/
    latitude = 42.319519;
    longitude = -72.629761;
  };
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
        alias l="lsd -liA --total-size --group-dirs last";
        alias ls="lsd";
        alias g="grep -P";
        alias ontouchpad="xinput enable 11";
	alias offtouchpad="xinput disable 11";
        alias rebuild="sudo nixos-rebuild switch";
        alias ctrlc="xclip -selection c";
        alias ctrlv="xclip -selection c -o";
	alias gpom="git push -u origin master";
	alias gs="git status";
	alias f="fish";
        alias sf="sudo fish";
        alias lynx="lynx -cfg=/etc/nixos/lynx.cfg";
        alias figlet="figlet -d /home/david/Documents/asciiart/figlet-fonts/";
        alias m="more";
        xinput disable 12;
        '';
    };
  };
  powerManagement = {
    enable = true;
    powerUpCommands =     "
        ";
    powerDownCommands =   "
      
        ";
    cpuFreqGovernor = "performance"; # "ondemand", "powersave", performance
  };
  system.stateVersion = "20.09";
}
