{ ... }:

{
  imports = [
   ./user/usr-config.nix
   ./user/usr-customization.nix
   ./user/usr-dev.nix
   ./user/usr-plasma.nix
  ];
  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
}
