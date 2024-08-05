{ ... }:

{
  imports = [
   ./user/configfiles.nix
   ./user/plasma.nix
  ];
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
