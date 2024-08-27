{
  description = "Moe.OS";
  # Define Inputs
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
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=v0.4.1";
    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.4.1";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  # Define Outputs, import Modules
  outputs =
    {
      nixpkgs,
      home-manager,
      jovian,
      plasma-manager,
      nix-flatpak,
      ...
    }:
    let
      # Define system globally since I have no aarch devices
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
      lib = nixpkgs.lib;
      # NixOS Modules for all hosts
      systemModules = [
        home-manager.nixosModules.home-manager
        nix-flatpak.nixosModules.nix-flatpak
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
      # Home Manager Modules for all hosts
      userModules = [
        ./modules/user/git
        ./modules/user/homeversion
        ./modules/user/shell
      ];
    in
    {
      nixosConfigurations = {
        # Workstation config
        # user and hostName variable inside hostConfig so we can call it in other modules
        workstation =
          let
            user = "mo";
            hostName = "workstation";
          in
          lib.nixosSystem {
            specialArgs = {
              inherit systemModules;
              inherit userModules;
              inherit system;
              inherit user;
              inherit hostName;
            };
            system = system;
            # Device specific NixOS Modules
            modules = systemModules ++ [
              jovian.nixosModules.jovian
              ./hosts/${hostName}
              ./modules/system/apps-misc
              ./modules/system/browser
              ./modules/system/controller
              ./modules/system/flatpak
              ./modules/system/jovian-${hostName}
              ./modules/system/lact
              ./modules/system/plasma
              ./modules/system/retrodeck
              ./modules/system/steam
              ./modules/system/syncthing
              ./modules/system/sddm
              {
                # Device specific Home Manager Modules
                home-manager.users.${user}.imports = userModules ++ [
                  ./modules/user/plasma
                ];
                # Issue with Plasma Manager, has to be imported in a special way
                home-manager.sharedModules = [ plasma-manager.homeManagerModules.plasma-manager ];
              }
            ];
          };
      };
      # Steamdeck config
      # user and hostName variable inside hostConfig so we can call it in other modules
      steamdeck =
        let
          user = "deck";
          hostName = "steamdeck";
        in
        lib.nixosSystem {
          specialArgs = {
            inherit systemModules;
            inherit userModules;
            inherit system;
            inherit user;
            inherit hostName;
          };
          system = system;
          # Device specific NixOS Modules
          modules = systemModules ++ [
            jovian.nixosModules.jovian
            ./hosts/${hostName}
            ./modules/system/apps-misc
            ./modules/system/browser
            ./modules/system/controller
            ./modules/system/flatpak
            ./modules/system/jovian-${hostName}
            ./modules/system/lact
            ./modules/system/plasma
            ./modules/system/retrodeck
            ./modules/system/steam
            ./modules/system/syncthing
            {
              # Device specific Home Manager Modules
              home-manager.users.${user}.imports = userModules ++ [
                ./modules/user/plasma
              ];
              # Issue with Plasma Manager, has to be imported in a special way
              home-manager.sharedModules = [ plasma-manager.homeManagerModules.plasma-manager ];
            }
          ];
        };

      konsole =
        let
          user = "deck";
          hostName = "konsole";
        in
        lib.nixosSystem {
          specialArgs = {
            inherit systemModules;
            inherit userModules;
            inherit system;
            inherit user;
            inherit hostName;
          };
          system = system;
          # Device specific NixOS Modules
          modules = systemModules ++ [
            jovian.nixosModules.jovian
            ./hosts/${hostName}
            ./modules/system/apps-misc
            ./modules/system/browser
            ./modules/system/controller
            ./modules/system/flatpak
            ./modules/system/jovian-${hostName}
            ./modules/system/lact
            ./modules/system/plasma
            ./modules/system/retrodeck
            ./modules/system/steam
            ./modules/system/syncthing
            {
              # Device specific Home Manager Modules
              home-manager.users.${user}.imports = userModules ++ [
                ./modules/user/plasma
              ];
              # Issue with Plasma Manager, has to be imported in a special way
              home-manager.sharedModules = [ plasma-manager.homeManagerModules.plasma-manager ];
            }
          ];
        };

       server =
        let
          user = "administrator";
          hostName = "server";
        in
        lib.nixosSystem {
          specialArgs = {
            inherit systemModules;
            inherit userModules;
            inherit system;
            inherit user;
            inherit hostName;
          };
          system = system;
          # Device specific NixOS Modules
          modules = systemModules ++ [
            ./hosts/${hostName}
            ./modules/docker
            ./modules/system/syncthing
            {
              # Device specific Home Manager Modules
              home-manager.users.${user}.imports = userModules ++ [
              ];
              # Issue with Plasma Manager, has to be imported in a special way
              home-manager.sharedModules = [];
            }
          ];
        };


    };
}
