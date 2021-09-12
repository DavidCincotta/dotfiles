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
#core comand line interface packages
{ config, lib, pkgs, ... }:
let
  dotfiles = {
    gitconfig = builtins.readFile /etc/nixos/secrets/gitconfig;
  };
  my-python-packages = python-packages: with python-packages; [
    pandas
    requests
    lxml
    selenium
    psutil
    ansible
  ]; 
  python-with-my-packages = pkgs.python3.withPackages my-python-packages;
in {
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
      pkgs.eidolon
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
      pkgs.sbt  #               scala standart interpreter / build tool
      pkgs.gcc  #               c++
      pkgs.rustup #             rust toolchain manager
      pkgs.rustc #              rust language
      pkgs.go #                 go language
      pkgs.bind #               standard linux tools - installed for dig
      pkgs.lynx #               terminal based browser, follows the same color scheme as system terminal
      pkgs.wget
      pkgs.w3m  #               
      pkgs.pandoc #             convert between many different type of file types
      pkgs.qbittorrent  #       standart torrent client
      #pkgs.neovim       #       new vim, I like normal vim
      pkgs.asciiquarium #       embrace marine life from the terminal with ascii art
      pkgs.gif-for-cli  #       Confert media to ascii art
      pkgs.sl   #               Steam Locomotive
      pkgs.lsd  #               colorful ls program written in rust
      pkgs.boxes #              draw boxes around input text
      pkgs.figlet #             make large letters out of input, ascii
      pkgs.lolcat #             add rainbow colors to standart output
      pkgs.jp2a   #             jpg to ascii art
      pkgs.toilet #             ascii in colorful letters
      python-with-my-packages # custom python3 instalation
      pkgs.gltron #             tron inspired snake
      pkgs.vitetris #           terminal tetris
      pkgs.nottetris2 #         physics based tetris successor
      pkgs.tty-solitaire #      terminal solitaire
      pkgs.graphviz
      pkgs.bat
      pkgs.fzf
      pkgs.maven
      pkgs.nodejs
      pkgs.dbus
    ];
    etc."gitconfig".text = dotfiles.gitconfig;
  };
}
