#   _       _________          _______  _______                                              
#  ( (    /|\__   __/|\     /|(  ___  )(  ____ \                                             
#  |  \  ( |   ) (   ( \   / )| (   ) || (    \/                                             
#  |   \ | |   | |    \ (_) / | |   | || (_____                                              
#  | (\ \) |   | |     ) _ (  | |   | |(_____  )                                             
#  | | \   |   | |    / ( ) \ | |   | |      ) |                                             
#  | )  \  |___) (___( /   \ )| (___) |/\____) |                                             
#  |/    )_)\_______/|/     \|(_______)\_______)  
#
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
      pkgs.vim_configurable
      pkgs.wpa_supplicant
      pkgs.xclip
      pkgs.zip
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
      pkgs.pandoc
      pkgs.qbittorrent
      pkgs.neovim
  ];
    etc."gitconfig".text = dotfiles.gitconfig;
  };
}
