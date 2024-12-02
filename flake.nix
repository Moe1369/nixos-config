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
  };

  outputs = { nixpkgs, home-manager, plasma-manager, jovian, nur, ... }:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
    lib = nixpkgs.lib;

    # Import module groups
    groups = import ./groups.nix;

    # External Modules
    externalSystemModules = [
      home-manager.nixosModules.home-manager
      jovian.nixosModules.jovian
      nur.nixosModules.nur
    ];
    externalUserModules = [ plasma-manager.homeManagerModules.plasma-manager ];

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
            externalSystemModules ++
            (groups.system.base hostName) ++
            (groups.system.plasma hostName) ++
            groups.system.sddm ++
            (groups.system.gaming hostName) ++ [
              {
                home-manager.users.${user}.imports =
                  groups.user.base ++
                  groups.user.plasma ++
                  groups.user.gaming;
                home-manager.extraSpecialArgs = { inherit user; inherit hostName; };
                home-manager.sharedModules = externalUserModules;
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
            externalSystemModules ++
            (groups.system.base hostName) ++
            (groups.system.plasma hostName) ++
            groups.system.sddm ++
            (groups.system.gaming hostName) ++ [
              {
                home-manager.users.${user}.imports =
                  groups.user.base ++
                  groups.user.plasma ++
                  groups.user.gaming;
                home-manager.extraSpecialArgs = { inherit user; inherit hostName; };
                home-manager.sharedModules = externalUserModules;
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
            externalSystemModules ++
            (groups.system.base hostName) ++
            (groups.system.plasma hostName) ++
            groups.system.sddm ++
            (groups.system.gaming hostName) ++ [
              {
                home-manager.users.${user}.imports =
                  groups.user.base ++
                  groups.user.plasma ++
                  groups.user.gaming;
                home-manager.extraSpecialArgs = { inherit user; inherit hostName; };
                home-manager.sharedModules = externalUserModules;
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
            externalSystemModules ++
            (groups.system.base hostName) ++
            groups.system.server ++ [
              {
                home-manager.users.${user}.imports =
                  groups.user.base ++
                  groups.user.server;
                home-manager.extraSpecialArgs = { inherit user; inherit hostName; };
                home-manager.sharedModules = externalUserModules;
              }
            ];
        };
    };
  };
}
