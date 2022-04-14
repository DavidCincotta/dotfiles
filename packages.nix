{ config, lib, pkgs, ... }:
let
  dotfiles = {
    alacritty_config = "/etc/nixos/alacritty.cfg";
    i3_config = "/etc/nixos/i3.cfg";
    gitconfig = builtins.readFile /etc/nixos/secrets/gitconfig;
  };
in
{
  programs = {
    java.enable=true;
    steam.enable=true;
    light.enable=true;
  };
  nixpkgs.config.permittedInsecurePackages = [
    "electron-12.2.3"
  ];
  nixpkgs.config.allowUnfree = true;
  environment = {
    systemPackages = [
      
      # critical or small packages
      
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
      pkgs.wpa_supplicant
      pkgs.xclip #              send cli output to the clipboard or the reverse
      pkgs.zip #                standard library for ziping directories
      pkgs.unzip
      pkgs.networkmanager #     mission critical wifi manager     
      pkgs.tree #               see tree structure of the filesystem
      pkgs.pciutils #           standard linux tools
      pkgs.gcc  #               c++
      pkgs.bind #               standard linux tools - installed for dig
      pkgs.wget
      pkgs.w3m  #               
      pkgs.qbittorrent  #       standart torrent client
      pkgs.pandoc #             convert between many different type of file types
      pkgs.bat
      pkgs.fzf
      pkgs.maven
      pkgs.lsd  #               colorful ls program written in rust
      pkgs.postgresql
      pkgs.awscli2
      pkgs.alacritty
      pkgs.feh
      pkgs.ffmpeg
      pkgs.hsetroot
      pkgs.libguestfs
      pkgs.libvirt
      pkgs.lmms
      pkgs.neofetch
      pkgs.polybar
      pkgs.openssl
      pkgs.scrot
      pkgs.networkmanagerapplet
      pkgs.google-chrome
      pkgs.ranger
      pkgs.i3
      #pkgs.mop   compiled in ~/go using alias to call
      pkgs.i3-gaps
      pkgs.pavucontrol
      pkgs.polybar
      pkgs.xorg.xmodmap
      pkgs.xorg.xset
      pkgs.nerdfonts
      pkgs.unclutter-xfixes
      pkgs.wkhtmltopdf
      pkgs.youtube-dl
      pkgs.mpv
      pkgs.mps-youtube
      pkgs.libnotify
      pkgs.notify-osd
      pkgs.twmn
      # programming languages

      #pkgs.orca-c
      #pkgs.heroku
      pkgs.nodejs-14_x
      pkgs.nodePackages.eslint
      #pkgs.nodePackages.typescript
      pkgs.scala
      pkgs.sbt
      pkgs.coursier
      #pkgs.rustup #             rust toolchain manager
      #pkgs.rustc #              rust language
      pkgs.go #                 go language
      

      # ascii art

      #pkgs.figlet #             make large letters out of input, ascii
      #pkgs.lolcat #             add rainbow colors to standart output
      #pkgs.jp2a   #             jpg to ascii art
      #pkgs.toilet #             ascii in colorful letters




      # applications

      pkgs.firefox
      pkgs.calibre
      pkgs.zoom-us
      pkgs.etcher
      pkgs.gparted
      pkgs.parted
      pkgs.spotify
      #pkgs.discord
      #pkgs.gnumeric
      #pkgs.skype
      #pkgs.slack-term
      #pkgs.libreoffice
      


      # games
      
      #pkgs.steam
      #pkgs.steamPackages.steamcmd
      #pkgs.steamPackages.steam
      #pkgs.steamPackages.steam-runtime
      #pkgs.steam-tui
      #pkgs.steam-run-native
      #pkgs.wine
      #pkgs.eidolon
      #pkgs.libgdiplus


      # networking

      #pkgs.pipewire
      pkgs.wireshark-cli
      pkgs.wireshark
      #pkgs.virt-manager
      #pkgs.virtualbox
      pkgs.gns3-gui
      pkgs.gns3-server
      pkgs.dynamips
      pkgs.ubridge
      pkgs.inetutils


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


    etc."gitconfig".text = dotfiles.gitconfig;
    etc."alacritty".text = builtins.readFile dotfiles.alacritty_config;
    sessionVariables.TERMINAL = ["alacritty"];
    sessionVariables.TERM = ["alacritty"];
    sessionVariables.EDITOR = ["vim"];
    variables = { EDITOR = "vim"; };
  };
}

