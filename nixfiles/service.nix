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
# Service Management
#
{ config, lib, pkgs, ...}:
{
  services = {
    openssh = {
      enable = true;
    };
    unclutter-xfixes = {
      enable = true;
      extraOptions = ["ignore-scrolling"];
    };
    logind = {
      lidSwitch = "lock";
      extraConfig = "
        IdleAction=poweroff;
        IdleActionSec=15min;
        HandlePowerKey=suspend;
      ";
    };
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
          configFile = "/etc/nixos/dotfiles/i3config.dotfile";
          extraPackages = with pkgs; [
            dmenu
            i3lock
          ];
        };
      };
    };
    picom.enable = true;
  };
}
