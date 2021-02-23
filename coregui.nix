# _       _________          _______  _______                                              
#( (    /|\__   __/|\     /|(  ___  )(  ____ \                                             
#|  \  ( |   ) (   ( \   / )| (   ) || (    \/                                             
#|   \ | |   | |    \ (_) / | |   | || (_____                                              
#| (\ \) |   | |     ) _ (  | |   | |(_____  )                                             
#| | \   |   | |    / ( ) \ | |   | |      ) |                                             
#| )  \  |___) (___( /   \ )| (___) |/\____) |                                             
#|/    )_)\_______/|/     \|(_______)\_______)  
#
# core GUI environment; strictly non-machine-specific things that do not work from a TTY.
{ config, lib, pkgs, ... }:
let
  dotfiles = {
    i3_config = "/etc/nixos/i3config.dotfile";
    alacritty_config = "/etc/nixos/alacrittyconfig.dotfile";
  };
in {
  imports = [
    ./chromium.nix
  ];
  environment = {
    systemPackages = [
      pkgs.alacritty
      pkgs.feh
      pkgs.ffmpeg
      pkgs.hsetroot
      pkgs.libguestfs
      pkgs.libvirt
      pkgs.lmms
      pkgs.neofetch
      pkgs.polybar
      pkgs.scrot
      pkgs.shotcut
      #pkgs.slock
      pkgs.virt-manager
      pkgs.xorg.xmodmap
      pkgs.xorg.xset
      pkgs.ranger
      #pkgs.vscode
      pkgs.google-chrome
      #pkgs.chromium
      #pkgs.jetbrains.phpstorm
      pkgs.calibre
      pkgs.etcher
      pkgs.gparted
      pkgs.spotify
      pkgs.discord
      pkgs.i3
      pkgs.i3-gaps
      pkgs.unclutter-xfixes
      pkgs.libreoffice
      pkgs.gnumeric
      #pkgs.wineStable
    ];
    etc."alacritty".text = builtins.readFile dotfiles.alacritty_config;
    sessionVariables.TERMINAL = ["alacritty"];
    sessionVariables.TERM = ["alacritty"];
    sessionVariables.EDITOR = ["vim"];
  };
  fonts.fonts = [
    pkgs.hack-font
  ];
  sound.enable = true;
  hardware.pulseaudio.enable = true;
  hardware.pulseaudio.support32Bit = true;
  location = {
    #https://www.latlong.net/
    latitude = 42.319519;
    longitude = -72.629761;
  };
  programs.light.enable = true;
  services = {
    xserver = {
      libinput.enable = true;
      libinput.naturalScrolling = true;
      autoRepeatDelay = 300;
      autoRepeatInterval = 30;
      desktopManager = {
        plasma5 = {
          enable = true;
        };
      };
      displayManager = {
          defaultSession = "plasma5+i3";
      };
      enable = true;
      layout = "us";
      autorun = true;
      windowManager = {
        i3 = {
          enable = true;
          package = pkgs.i3-gaps;
          configFile = dotfiles.i3_config;
          extraPackages = with pkgs; [
            dmenu
            i3lock
          ];
        };
      };
    };
    blueman.enable = true;
    picom.enable = true;
  };
  security = {
    wrappers = {
      slock = {
        source = "${pkgs.slock.out}/bin/slock";
      };
    };
  };
}
