{
  description = "Moe.OS";
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "nixpkgs/release-24.05";
    jovian.url = "github:Jovian-Experiments/Jovian-NixOS/development";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    plasma-manager.url = "github:nix-community/plasma-manager/trunk";
    plasma-manager.inputs.nixpkgs.follows = "nixpkgs";
    plasma-manager.inputs.home-manager.follows = "home-manager";
  };
  outputs = { self,nixpkgs,nixpkgs-stable, home-manager, jovian, plasma-manager, ...}:
   let
    lib = nixpkgs.lib;
    system = "x86_64-linux";
    pkgs = import nixpkgs {inherit system; config.allowUnfree = true; };
    pkgs-stable = import nixpkgs-stable {inherit system; config.allowUnfree = true; };
    in {
    nixosConfigurations = {
      computer-mo = nixpkgs.lib.nixosSystem {
       inherit system;
       modules = [
          ./configuration.nix
          jovian.nixosModules.default
       ];
       specialArgs = {
         inherit pkgs-stable;
       };
      };
    };
 };
}
