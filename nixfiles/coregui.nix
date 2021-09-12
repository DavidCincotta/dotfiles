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
# core GUI environment; strictly non-machine-specific things that do not work from a TTY.
{ config, lib, pkgs, ... }:
let
  dotfiles = {
    i3_config = "/etc/nixos/dotfiles/i3config.dotfile";
    alacritty_config = "/etc/nixos/dotfiles/alacrittyconfig.dotfile";
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
      pkgs.zoom-us
      pkgs.nerdfonts
      pkgs.skype
      pkgs.polybar
      pkgs.slack-term
      pkgs.wireshark
      pkgs.wireshark-cli
    ];
    etc."alacritty".text = builtins.readFile dotfiles.alacritty_config;
    sessionVariables.TERMINAL = ["alacritty"];
    sessionVariables.TERM = ["alacritty"];
  };
  fonts = {
    enableDefaultFonts = true;
    fonts = [
      pkgs.nerdfonts
    ];
    fontconfig = {
      localConf = ''
<?xml version='1.0'?>
<!DOCTYPE fontconfig SYSTEM 'fonts.dtd'>
<fontconfig>

<!-- Default font (no fc-match pattern) -->
 <match>
  <edit mode="prepend" name="family">
   <string>Fixed</string>
  </edit>
 </match>

<!-- Default sans-serif font -->
 <match target="pattern">
   <test qual="any" name="family"><string>sans-serif</string></test>
   <!--<test qual="any" name="lang"><string>ja</string></test>-->
   <edit name="family" mode="prepend" binding="same"><string>Fixed</string>  </edit>
 </match>
 
<!-- Default serif fonts -->
 <match target="pattern">
   <test qual="any" name="family"><string>serif</string></test>
   <edit name="family" mode="prepend" binding="same"><string>Fixed</string>  </edit>
 </match>

<!-- Default monospace fonts -->
 <match target="pattern">
   <test qual="any" name="family"><string>monospace</string></test>
   <edit name="family" mode="prepend" binding="same"><string>Fixed</string></edit>
 </match>

<!-- Fallback fonts preference order -->
 <alias>
  <family>sans-serif</family>
  <prefer>
   <family>Fixed</family>
  </prefer>
 </alias>
 <alias>
  <family>serif</family>
  <prefer>
   <family>Fixed</family>
  </prefer>
 </alias>
 <alias>
  <family>monospace</family>
  <prefer>
   <family>Fixed</family>
  </prefer>
 </alias>

</fontconfig>
      '';
    };
  };
  programs.light.enable = true;
  security = {
    wrappers = {
      slock = {
        source = "${pkgs.slock.out}/bin/slock";
      };
    };
  };
}
