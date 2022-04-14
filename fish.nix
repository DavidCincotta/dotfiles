{pkgs,...}:
{
  users.extraUsers.david.shell = pkgs.fish;
  programs.fish = {
    enable = true;
    interactiveShellInit = ''

      # git alias

      alias gs="git status";
      alias ga="git add";
      alias gm="git commit -m ";
      alias gp="git push";
      alias gpom="git push -u origin master";
      alias gs="git status";


      # nix alias

      alias rebuild="sudo nixos-rebuild switch";


      #general alias

      alias e="vim -n";
      alias s="sudo";
      alias se="sudo vim -n";
      alias l="lsd -liAS --total-size --group-dirs last";
      alias ls="lsd";
      alias g="grep -P";
      alias m="more";
      alias f="fish";
      alias sf="sudo fish";
      alias ctrlc="xclip -selection c";
      alias ctrlv="xclip -selection c -o";


      # package specific alias

      alias figlet="figlet -d /home/david/Documents/asciiart/figlet-fonts/";
      alias lynx="lynx -cfg=/etc/nixos/dotfiles/lynx.cfg";
      alias mop="~/go/bin/mop;"




      # alter touchpad

      alias ontouchpad="xinput enable 11";
      alias offtouchpad="xinput disable 11";
      #xinput disable 12;
      #xinput disable 11;
      '';  
    };
}
