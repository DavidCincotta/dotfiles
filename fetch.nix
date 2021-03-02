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
{ config, lib, pkgs, ...}:
#1nm0xhdrx3bvqwzvcgi3jp5jsh1vy30w766k2m750ficgzv9l0bw


let
  cadubi = import
    ( pkgs.fetchFromGitHub
      {
        owner = "statico";
        repo = "cadubi";
        rev= "vx39nx8xgfw0mbndrjplggdn0hi4npx8";
        sha256= "1nm0xhdrx3bvqwzvcgi3jp5jsh1vy30w766k2m750ficgzv9l0bw";
      }
    );
in {
  environment = {
    systemPackages = [
      cadubi
    ];
  };
}
