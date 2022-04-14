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
    ];
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
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
    extraUsers.david.shell = pkgs.fish;
    };
  security.sudo.wheelNeedsPassword = false;
  virtualisation.virtualbox.host.enable = true;
  system.stateVersion = "22.05";


  programs = {
    java.enable=true;
    steam.enable=true;
    light.enable=true;
    fish = {
      enable = true;
      interactiveShellInit = ''
        alias gs="git status";
        alias ga="git add";
        alias gm="git commit -m ";
        alias gp="git push";
        alias e="vim -n";
        alias s="sudo";
        alias se="sudo vim -n";
        alias l="lsd -liAS --total-size --group-dirs last";
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
  nixpkgs.config.allowUnfree = true;
  environment = {
    systemPackages = [
      pkgs.acpi
      pkgs.age
      pkgs.atop
      pkgs.bash
      pkgs.bat
      pkgs.curl
      pkgs.docker
      pkgs.elixir
      pkgs.entr
      pkgs.exa
      pkgs.fd
      pkgs.file
      pkgs.fzf
      pkgs.git #              Standart Version control
      pkgs.gnugrep
      pkgs.gnumake
      pkgs.gnupg
      pkgs.gnused
      pkgs.gnutar
      pkgs.htop
      pkgs.killall
      pkgs.less
      pkgs.ncdu
      pkgs.netcat
      pkgs.nix
      pkgs.nmap
      pkgs.objconv
      pkgs.openvpn
      pkgs.pinentry
      pkgs.ripgrep
      pkgs.rsync
      pkgs.sd
      pkgs.tig
      pkgs.tldr
      pkgs.tmux
      pkgs.tree #               see tree structure of the filesystem
      #pkgs.vim_configurable #   vim that uses plugins
      pkgs.wpa_supplicant
      pkgs.xclip #              send cli output to the clipboard or the reverse
      pkgs.zip #                standard library for ziping directories
      pkgs.unzip
      pkgs.fish #               great shell, cool features like wild cards, 
      pkgs.networkmanager #     mission critical wifi manager
      #pkgs.blueman #           bluetooth manager like network manager, seems to be unecessary 
      pkgs.pciutils #           standard linux tools
      pkgs.gcc  #               c++
      #pkgs.rustup #             rust toolchain manager
      #pkgs.rustc #              rust language
      #pkgs.go #                 go language
      pkgs.bind #               standard linux tools - installed for dig
      #pkgs.lynx #               terminal based browser, follows the same color scheme as system terminal
      pkgs.wget
      pkgs.w3m  #               
      #pkgs.pandoc #             convert between many different type of file types
      #pkgs.qbittorrent  #       standart torrent client
      #pkgs.neovim       #       new vim, I like normal vim
      pkgs.asciiquarium #       embrace marine life from the terminal with ascii art
      #pkgs.gif-for-cli  #       Confert media to ascii art
      pkgs.lsd  #               colorful ls program written in rust
      #pkgs.boxes #              draw boxes around input text
      #pkgs.figlet #             make large letters out of input, ascii
      #pkgs.lolcat #             add rainbow colors to standart output
      #pkgs.jp2a   #             jpg to ascii art
      #pkgs.toilet #             ascii in colorful letters
      #pkgs.graphviz
      pkgs.bat
      pkgs.fzf
      pkgs.maven
      #pkgs.nodejs-14_x
      #pkgs.nodePackages.eslint
      #pkgs.nodePackages.typescript
      #pkgs.nudoku
      #pkgs.heroku
      #pkgs.orca-c
      pkgs.postgresql
      pkgs.awscli2
      pkgs.openssl
      
      pkgs.scala
      pkgs.sbt
      pkgs.coursier

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
      #pkgs.virt-manager
      pkgs.xorg.xmodmap
      pkgs.xorg.xset
      pkgs.ranger
      pkgs.google-chrome
      #pkgs.chromium
      pkgs.calibre
      #pkgs.etcher
      #pkgs.gparted
      #pkgs.spotify
      #pkgs.discord
      pkgs.i3
      pkgs.i3-gaps
      pkgs.unclutter-xfixes
      #pkgs.libreoffice
      #pkgs.gnumeric
      pkgs.zoom-us
      pkgs.nerdfonts
      #pkgs.skype
      pkgs.polybar
      #pkgs.slack-term
      pkgs.wireshark
      pkgs.wireshark-cli
      pkgs.pavucontrol
      

      pkgs.gns3-gui
      pkgs.gns3-server
      pkgs.dynamips
      pkgs.ubridge
      pkgs.inetutils

      pkgs.networkmanagerapplet


      (pkgs.neovim.override {
        vimAlias = true;
        configure = {
          packages.myPlugins = with pkgs.vimPlugins; {
            start = [ vim-lastplace vim-nix ]; 
            opt = [];
          };
          customRC = ''
            " your custom vimrc
            set number
            set hidden
            syntax on
            set nocompatible
            set backspace=indent,eol,start
            set tabstop=4
            set shiftwidth=4
            set expandtab
            " ...
            '';
          };
        }
      )
    ];


    sessionVariables.TERMINAL = ["alacritty"];
    sessionVariables.TERM = ["alacritty"];
    sessionVariables.EDITOR = ["vim"];
    variables = { EDITOR = "vim"; };
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
  security = {
    wrappers = { 
      ubridge= {
        #setuid=true;
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
      #killUserProcesses = true;
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
        #defaultSession = "plasma+i3";
          autoLogin={
            enable=true;
            user="david";
        };
      };
      enable = true;
      layout = "us";
      autorun = true;
      windowManager = {
        i3 = {
          enable = true;
          package = pkgs.i3-gaps;
          configFile = "/etc/nixos/i3.cfg";
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
