#
#     .o88o.  o8o           oooo        
#     888 `"  `"'           `888        
#    o888oo  oooo   .oooo.o  888 .oo.   
#     888    `888  d88(  "8  888P"Y88b  
#     888     888  `"Y88b.   888   888  
#     888     888  o.  )88b  888   888  
#    o888o   o888o 8""888P' o888o o888o 
#                                       
#                                       
#                                       
#             oooo                  oooo  oooo  
#             `888                  `888  `888  
#     .oooo.o  888 .oo.    .ooooo.   888   888  
#    d88(  "8  888P"Y88b  d88' `88b  888   888  
#    `"Y88b.   888   888  888ooo888  888   888  
#    o.  )88b  888   888  888    .o  888   888  
#    8""888P' o888o o888o `Y8bod8P' o888o o888o 
#                                               
#                                               
#                                               
# computes the difference in files between the git repository and the /etc/ files that produce the system. 

ls -l /etc/nixos/ 				| grep -Po '(\d\d\:\d\d)(.)*((\.nix)|(\.dotfile)|(\.shell|(\.python.?)|\.fish)|(\.cfg))' | grep -Po '(\S)*$'  > p1
ls -l /home/david/Documents/NixOSCompleteConfig	 	| grep -Po '(\d\d\:\d\d)(.)*((\.nix)|(\.dotfile)|(\.shell|(\.python.?)|\.fish)|(\.cfg))' | grep -Po '(\S)*$'  > p2
diff p1 p2 | grep -Po '(\s)(\S)*' | grep -Po '(\S)*' > p3
cat p3

rm p1 p2 p3
