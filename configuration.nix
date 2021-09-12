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
      ./nixfiles/coregui.nix
      ./nixfiles/corecli.nix
      ./nixfiles/service.nix
      ./nixfiles/vim.nix
      ./nixfiles/networking.nix
    ];
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    kernelPackages = pkgs.linuxPackages_latest;
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
  powerManagement = {
    enable = true;
    powerDownCommands = "poweroff;";
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
        alias lynx="lynx -cfg=/etc/nixos/dotfiles/lynx.cfg";
        alias figlet="figlet -d /home/david/Documents/asciiart/figlet-fonts/";
        alias m="more";
        #xinput disable 12;
        #xinput disable 11;
        '';
       
    };
  };
  system.stateVersion = "20.09";
}
