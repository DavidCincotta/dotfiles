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
#custom neovim instalation
{ pkgs, ... }:
{
  environment.variables = { EDITOR = "vim"; };

  environment.systemPackages = with pkgs; [
    (neovim.override {
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
          " ...
        '';
      };
    }
  )];
}
