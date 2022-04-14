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
let
  file = {
    alacritty_config = "/etc/nixos/alacritty.cfg";
    i3_config = "/etc/nixos/i3.cfg";
    gitconfig = builtins.readFile /etc/nixos/secrets/gitconfig;
  };
in
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./python3.nix
      ./fonts.nix
      ./fish.nix
      ./chrome.nix
      ./packages.nix
      ./nix-alien.nix
      ./vscode.nix
      ./systemd.nix
      ./FetchFromGit.nix
  ];
  system.stateVersion = "22.05";
  system.nixos.label = "A.C.";
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      grub = {
        devices = [ "nodev" ];
        enable = false;
        efiSupport = true;
        version = 2;
        useOSProber = true;
      };
    };
    kernelPackages = pkgs.linuxPackages_latest;
  };
  sound.enable = true;
  sound.mediaKeys.enable=true;
  hardware = {
    pulseaudio = {
      enable = true;
      package = pkgs.pulseaudioFull;
      support32Bit = true;
    };
    bluetooth.enable = true;
  };
  time.timeZone = "America/New_York";
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
        extraGroups = ["wheel" "networkmanager" "pulse" "audio" "sound"];
      };
    };
    extraGroups.vboxusers.members=["david"];
  };
  security.sudo.wheelNeedsPassword = false;
  virtualisation.virtualbox.host.enable = true;
  security = {
    wrappers = { 
      ubridge= {
        owner = "root";
        group = "root";
        source = "${pkgs.ubridge.out}/bin/ubridge";
        capabilities = "cap_net_admin+eip cap_net_raw+eip cap_net_broadcast+eip cap_net_bind_service+eip";
      };
    };
  };
  networking = {
    hostName = "nixos";
    #wireless.enable = true;#Handled by NM better 
    networkmanager = {
      enable = true;
      wifi.powersave = false;
    };
    useDHCP = false;
    useNetworkd = false;
  };
  services = {
    openssh = {
      enable = true;
    };
    unclutter-xfixes = {
      enable = true;
      extraOptions = ["ignore-scrolling"];
    };
    logind = {
      extraConfig = "
        HandleLidSwitch=ignore
        HandleLidSwitchDocked=ignore
        HandleLidSwitchExternalPower=ignore
      ";
    };
    xserver = {
      libinput.enable = true;
      libinput.touchpad.naturalScrolling = true;
      autoRepeatDelay = 300;
      autoRepeatInterval = 30;
      desktopManager = {
        plasma5 = {
          enable = false;
        };
      };
      displayManager = {
        defaultSession = "none+i3";
          autoLogin={
            enable=true;
            user="david";
        };
      };
      enable = true;
      layout = "us";
      #autorun = true;
      windowManager = {
        i3 = {
          enable = true;
          package = pkgs.i3-gaps;
          configFile = file.i3_config;
          extraPackages = with pkgs; [
            dmenu
            i3lock
            i3status
          ];
        };
      };
    };
  };
}
