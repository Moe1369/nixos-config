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

  outputs = { nixpkgs, home-manager, jovian, plasma-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
      lib = nixpkgs.lib;

      systemModules = [
        home-manager.nixosModules.home-manager
        ./modules/system/apps-shell
        ./modules/system/boot
        ./modules/system/devices
        ./modules/system/home-manager
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
    in {
      nixosConfigurations = {
        workstation = let
          user = "mo";
          hostName = "workstation";
        in
          lib.nixosSystem {
            inherit system;
            specialArgs = {
              inherit systemModules userModules user hostName;
            };
            modules = systemModules ++ [
              jovian.nixosModules.jovian
              ./hosts/${hostName}
              ./modules/system/apps-misc
              ./modules/system/browser
              ./modules/system/controller
              ./modules/system/jovian-${hostName}
              ./modules/system/lact
              ./modules/system/sddm
              ./modules/system/plasma
              ./modules/system/steam
              {
                home-manager.users.${user}.imports = userModules ++ [
                  ./modules/user/plasma
                ];
                home-manager.sharedModules = [ plasma-manager.homeManagerModules.plasma-manager ];
              }
            ];
          };

        steamdeck = let
          user = "deck";
          hostName = "steamdeck";
        in
          lib.nixosSystem {
            inherit system;
            specialArgs = {
              inherit systemModules userModules user hostName;
            };
            modules = systemModules ++ [
              jovian.nixosModules.jovian
              ./hosts/${hostName}
              ./modules/system/apps-misc
              ./modules/system/browser
              ./modules/system/controller
              ./modules/system/jovian-${hostName}
              ./modules/system/lact
              ./modules/system/plasma
              ./modules/system/steam
              {
                home-manager.users.${user}.imports = userModules ++ [
                  ./modules/user/plasma
                ];
                home-manager.sharedModules = [ plasma-manager.homeManagerModules.plasma-manager ];
              }
            ] ++ lib.optional (!lib.hasAttr "system.build.isoImage" pkgs.nixos) [
              {
                # Define ISO only if it hasn't been defined yet
                system.build.isoImage = pkgs.nixos.install {
                  modules = [ ./hosts/${hostName} ];
                };
              }
            ];
          };
      };
    };
}
