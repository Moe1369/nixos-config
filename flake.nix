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
    agenix.url = "github:ryantm/agenix";
    nur.url = "github:nix-community/NUR";
    cachix.url = "github:cachix/cachix";
  };

  outputs = { nixpkgs, home-manager, plasma-manager, jovian, nur, cachix, ... }:
  let
    groups = import ./groups.nix;
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
    lib = nixpkgs.lib;

    systemModules = [
      home-manager.nixosModules.home-manager
      jovian.nixosModules.jovian
      nur.nixosModules.nur
      cachix.nixosModules.cachix
    ];
    userModules =  [
    plasma-manager.homeManagerModules.plasma-manager
    ];

  in
  {
    nixosConfigurations = {
      workstation =
        let
          user = "mo";
          hostName = "workstation";
        in
        lib.nixosSystem {
          specialArgs = { inherit user; inherit hostName; inherit system; };
          modules =
            systemModules ++
            groups.system.workstation ++
            groups.system.base ++
            groups.system.plasma ++
            groups.system.sddm ++
            groups.system.gaming ++ [
              {
                home-manager.users.${user}.imports =
                  groups.user.base ++
                  groups.user.plasma ++
                  groups.user.gaming;
                home-manager.extraSpecialArgs = { inherit user; inherit hostName; };
                home-manager.sharedModules = userModules;
                services.cachix = {
                    enable = true;
                    useNix = true;
                    binaryCaches = [ "jovian245252" ];
          };
        }
      ];
  };
      konsole =
        let
          user = "mo";
          hostName = "konsole";
        in
        lib.nixosSystem {
          specialArgs = { inherit user; inherit hostName; inherit system; };
          modules =
            systemModules ++
            groups.system.konsole ++
            groups.system.base ++
            groups.system.plasma ++
            groups.system.sddm ++
            groups.system.gaming ++ [
              {
                home-manager.users.${user}.imports =
                  groups.user.base ++
                  groups.user.plasma ++
                  groups.user.gaming;
                home-manager.extraSpecialArgs = { inherit user; inherit hostName; };
                home-manager.sharedModules = userModules;
              }
            ];
        };

      steamdeck =
        let
          user = "deck";
          hostName = "steamdeck";
        in
        lib.nixosSystem {
          specialArgs = { inherit user; inherit hostName; inherit system; };
          modules =
            systemModules ++
            groups.system.steamdeck ++
            groups.system.base ++
            groups.system.plasma ++
            groups.system.sddm ++
            groups.system.gaming ++ [
              {
                home-manager.users.${user}.imports =
                  groups.user.base ++
                  groups.user.plasma ++
                  groups.user.gaming;
                home-manager.extraSpecialArgs = { inherit user; inherit hostName; };
                home-manager.sharedModules = userModules;
              }
            ];
        };

      server =
        let
          user = "administrator";
          hostName = "server";
        in
        lib.nixosSystem {
          specialArgs = { inherit user; inherit hostName; inherit system; };
          modules =
            systemModules ++
            groups.system.server ++
            groups.system.base ++
            groups.system.container ++ [
              {
                home-manager.users.${user}.imports =
                  groups.user.base ++
                  groups.user.container;
                home-manager.extraSpecialArgs = { inherit user; inherit hostName; };
                home-manager.sharedModules = userModules;
              }
            ];
        };
    };
  };
}
