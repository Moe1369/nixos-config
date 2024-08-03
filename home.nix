{ config, pkgs, pkgs-stable, ... }:

{
  imports = [
   ./user/plasma.nix
   ./user/config.nix
  ];
  home.username = "mo";
  home.homeDirectory = "/home/mo";
  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
  programs.git = {
   enable = true;
   userName = "Mohamed C.";
   userEmail = "mohamed@chrayed.de";
   extraConfig = {
     init.defaultBranch = "main";
   };
  };
}
