{
  description = "Moe.OS";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "nixpkgs/nixos-24.05";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager-stable.url = "github:nix-community/home-manager/release-24.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    home-manager-stable.inputs.nixpkgs.follows = "nixpkgs-stable";
  };

  outputs = { self,nixpkgs,nixpkgs-stable, home-manager, ...}:
   let
    lib = nixpkgs.lib;
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    pkgs-stable = nixpkgs-stable.legacyPackages.${system};
    in {
    nixosConfigurations = {
      computer-mo = nixpkgs.lib.nixosSystem {
       inherit system;
       modules = [./configuration.nix];
       specialArgs = {
         inherit pkgs-stable;
       };
      };
    };
    homeConfigurations = {
      mo = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      modules = [./home.nix];
      extraSpecialArgs = {
        inherit pkgs-stable;
      };
    };
  };
 };
}
