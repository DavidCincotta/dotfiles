#NixOS
###declarative system configuration
The repository underwent a major refactoring after some unexpected problems cropped up.
To make new additions and debugging easier I have better parametized into modules.

The file recovery.nix is to be renamed to 'configuration.nix' in case of a catastrophic system
failure; it is a minimum installation that has successfully booted logged in after a crash. 

The source of that failure is what I am currently working on. For some reason my nix-profile
'is not a symlink'. This generally means that my nix-environment is not being tracked properly.
This results in not being able to rollback, selelct generations from boot, and use a variety of
nix commands. 

Rebuild still works. Ultimately I think a full reinstall is necessary.

test ssh
