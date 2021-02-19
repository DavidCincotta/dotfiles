#  d8b   db d888888b db    db  .d88b.  .d8888. 
#  888o  88   `88'   `8b  d8' .8P  Y8. 88'  YP 
#  88V8o 88    88     `8bd8'  88    88 `8bo.   
#  88 V8o88    88     .dPYb.  88    88   `Y8b. 
#  88  V888   .88.   .8P  Y8. `8b  d8' db   8D 
#  VP   V8P Y888888P YP    YP  `Y88P'  `8888Y' 

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
      #pkgs.ranger
      #pkgs.vscode
      #pkgs.jetbrains.phpstorm
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
      pkgs.discord
      pkgs.libreoffice
      pkgs.gnumeric
    ];
    etc."alacritty".text = builtins.readFile dotfiles.alacritty_config;
    sessionVariables.TERMINAL = ["alacritty"];
    sessionVariables.TERM = ["alacritty"];
    sessionVariables.EDITOR = ["vim"];
    sessionVariables.COLOR_SCHEME = ["000"];
    sessionVariable.WALLPAPER_PATH =["/home/david/Pictures/vaporwave.jpg"]
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
