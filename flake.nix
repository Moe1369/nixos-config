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
    nypkgs = {
      url = "github:yunfachi/nypkgs";
      inputs.nixpkgs.follows = "nixpkgs";
  };
  };
  outputs = { self, nixpkgs, home-manager, jovian, plasma-manager, ...}:
   let
    # Different Devices
    host-computer = "computer-mo";
    user-computer = "mo";

    lib = nixpkgs.lib;
    system = "x86_64-linux";
    pkgs = import nixpkgs {inherit system;};
    in {

    nixosConfigurations = {
      ${host-computer} = lib.nixosSystem {
       specialArgs = {};
       modules = [
          ./hosts/${host-computer}/system
          ./global/system
          jovian.nixosModules.jovian
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";
            home-manager.extraSpecialArgs = {inherit pkgs;};
            home-manager.users.${user-computer}.imports = [
                                          ./hosts/${host-computer}/user
                                          ./global/user
                                          ];
            home-manager.sharedModules = [ plasma-manager.homeManagerModules.plasma-manager];
          }
       ];
      };
    };
 };
}
