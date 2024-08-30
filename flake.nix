{
  description = "Moe.OS";

  # Define Inputs
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    plasma-manager = {
      url = "github:nix-community/plasma-manager/trunk";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
    jovian.url = "github:Jovian-Experiments/Jovian-NixOS/development";
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=v0.4.1";
  };

  # Define Outputs, import Modules
  outputs = { nixpkgs, home-manager, plasma-manager, jovian, nix-flatpak, ... }:
  let
    # Define system globally since I have no aarch devices
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
    lib = nixpkgs.lib;
    # External Modules
    externalSystemModules = [home-manager.nixosModules.home-manager jovian.nixosModules.jovian nix-flatpak.nixosModules.nix-flatpak];
    externalUserModules = [ plasma-manager.homeManagerModules.plasma-manager];
    # System Module groups
    baseSystemModules = [
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
    desktopSystemModules = [
        ./modules/system/ai
        ./modules/system/apps-misc
        ./modules/system/browser
        ./modules/system/flatpak
        ./modules/system/plasma
    ];
    displaySystemModules = [
        ./modules/system/sddm
    ];
    gamingSystemModules = [
        ./modules/system/controller
        ./modules/system/lact
        ./modules/system/retrodeck
        ./modules/system/steam
        ./modules/system/syncthing
    ];

    serverSystemModules = [
        ./modules/system/docker
    ];
    # USER Module groups
    baseUserModules = [
        ./modules/user/git
        ./modules/user/homeversion
        ./modules/user/shell
    ];
    desktopUserModules = [
        ./modules/user/plasma
    ];
    gamingUserModules = [];
    serverUserModules = [];
  in
  {
    nixosConfigurations = {
      # Workstation config
      workstation =
        let
          user = "mo";
          hostName = "workstation";
        in
        lib.nixosSystem {
          specialArgs = {inherit user; inherit hostName;};
          system = system;
          # Device specific NixOS Modules
          modules = externalSystemModules ++ baseSystemModules ++ desktopSystemModules ++ displaySystemModules ++ gamingSystemModules ++ [
            ./hosts/${hostName}
            ./modules/system/jovian-${hostName}
            {
              # Device specific Home Manager Modules
              home-manager.users.${user}.imports = baseUserModules ++ desktopUserModules ++ [
              ];
              # Issue with Plasma Manager, has to be imported in a special way
              home-manager.extraSpecialArgs = { inherit user; inherit hostName;};
              home-manager.sharedModules =  externalUserModules;
            }
          ];
        };
    };
  };
}
