{
  description = "Moe.OS";
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    jovian.url = "github:Jovian-Experiments/Jovian-NixOS/development";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    plasma-manager = {
      url= "github:nix-community/plasma-manager/trunk";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
  };
  outputs = { self, nixpkgs, home-manager, jovian, plasma-manager,  ...}:
   let
    lib = nixpkgs.lib;
    host = "computer-mo";
    user = "mo";
    system = "x86_64-linux";
    pkgs = import nixpkgs {inherit system;};
    in {
    nixosConfigurations = {
      ${host} = lib.nixosSystem {
       specialArgs = {inherit user host;};
       modules = [
          ./hosts/${host}/system-imports.nix
          jovian.nixosModules.jovian
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";
            home-manager.extraSpecialArgs = {inherit pkgs;};
            home-manager.users.${user}.imports = [./hosts/${host}/user-imports.nix];
            home-manager.sharedModules = [ plasma-manager.homeManagerModules.plasma-manager];
          }
       ];
      };
    };
 };
}
