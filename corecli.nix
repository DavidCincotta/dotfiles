#  d8b   db d888888b db    db  .d88b.  .d8888. 
#  888o  88   `88'   `8b  d8' .8P  Y8. 88'  YP 
#  88V8o 88    88     `8bd8'  88    88 `8bo.   
#  88 V8o88    88     .dPYb.  88    88   `Y8b. 
#  88  V888   .88.   .8P  Y8. `8b  d8' db   8D 
#  VP   V8P Y888888P YP    YP  `Y88P'  `8888Y' 

#core comand line interface packages
{ config, lib, pkgs, ... }:
let
  dotfiles = {
    gitconfig = builtins.readFile /etc/nixos/gitconfig;
  };
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
      pkgs.git
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
      pkgs.pandoc
      pkgs.pinentry
      pkgs.ripgrep
      pkgs.rsync
      pkgs.sd
      pkgs.tig
      pkgs.tldr
      pkgs.tmux
      pkgs.tree
      pkgs.unzip
      pkgs.vim
      pkgs.wpa_supplicant
      pkgs.xclip
      pkgs.zip
      pkgs.zsh
      pkgs.fish
      pkgs.networkmanager
      pkgs.blueman
      pkgs.pciutils
      pkgs.sbt
      pkgs.gcc
      pkgs.rustup
      pkgs.go
      pkgs.bind
      pkgs.lynx
      pkgs.wget
      pkgs.w3m
  ];
    etc."gitconfig".text = dotfiles.gitconfig;
  };
}
