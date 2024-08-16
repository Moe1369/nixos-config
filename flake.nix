{
  description = "Moe.OS";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    jovian.url = "github:Jovian-Experiments/Jovian-NixOS/development";
    plasma-manager = {
      url = "github:nix-community/plasma-manager/trunk";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
  };
  outputs = { nixpkgs, home-manager, jovian, plasma-manager, ...}:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system;};
    lib = nixpkgs.lib;
  in
  {
    systemModules = [
      home-manager.nixosModules.home-manager
      ./modules/system/apps-shell
      ./modules/system/boot
      ./modules/system/devices
      ./modules/system/locale
      ./modules/system/networking
      ./modules/system/nixsettings
      ./modules/system/shell
      ./modules/system/systemversion
      ./modules/system/upgrades
      ./modules/system/users
    ];

    userModules = [
      ./modules/user/git
      ./modules/user/homeversion
    ];

    nixosConfigurations = {
      computer-mo = nixpkgs.lib.nixosSystem {
        hostName = "computer-mo";
        user = "mo";
        system = system;
        modules = systemModules ++ [
          jovian.nixosModules.jovian
          ./hosts/${hostName}
          ./modules/system/apps-misc
          ./modules/system/browser
          ./modules/system/controller
          ./modules/system/jovian-desktop
          ./modules/system/lact
          ./modules/system/plasma
          ./modules/system/steam
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.${user} = import ./modules/user/plasma;
            home-manager.backupFileExtension = "backup";
            home-manager.extraSpecialArgs = { inherit pkgs; };
            home-manager.sharedModules = [ plasma-manager.homeManagerModules.plasma-manager ];
          }
        ];
      };
    };
  };
}
