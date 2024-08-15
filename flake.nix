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
      url = "github:nix-community/plasma-manager/trunk";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
  };

  outputs = { self, nixpkgs, home-manager, jovian, plasma-manager, ... }:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };

      commonModules = [
        home-manager.nixosModules.home-manager
        jovian.nixosModules.jovian
        ./modules/apps.misc
        ./modules/apps.shell
        ./modules/boot
        ./modules/browser
        ./modules/controller
        ./modules/devices
        ./modules/jovian.desktop
        ./modules/lact
        ./modules/locale
        ./modules/networking
        ./modules/nixsettings
        ./modules/plasma
        ./modules/shell
        ./modules/steam
        ./modules/systemversion
        ./modules/upgrade
      ];

      homeManagerConfig = {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.backupFileExtension = "backup";
        home-manager.extraSpecialArgs = { inherit pkgs; };
        home-manager.sharedModules = [ plasma-manager.homeManagerModules.plasma-manager ];
      };

      # Host-specific configurations
      hosts = {
        computer-mo = {
          user = "mo";
          extraModules = [];
          userConfig = {
            isNormalUser = true;
            home = "/home/mo";
            shell = pkgs.zsh;
            extraGroups = [ "wheel" "networkmanager" ];
          };
        };

        steamdeck = {
          user = "deck";
          extraModules = [];
          userConfig = {
            isNormalUser = true;
            home = "/home/deck";
            shell = pkgs.zsh;
            extraGroups = [ "wheel" "networkmanager" ];
          };
        };
      };

    in {
      nixosConfigurations = lib.mapAttrs (hostName: hostConfig:
        lib.nixosSystem {
          specialArgs = {};
          modules = commonModules ++ hostConfig.extraModules ++ [
            # Users configuration
            { users.users.${hostConfig.user} = hostConfig.userConfig; }

            # Home Manager user imports
            { home-manager.users.${hostConfig.user}.imports = [
              ./modules/git
              ./modules/homeversion
              ./modules/plasma
              ];
            }
            homeManagerConfig
          ];
        }
      ) hosts;
    };
}
