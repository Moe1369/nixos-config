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
    jovian.inputs.nixpkgs.follows = "nixpkgs";
    agenix.url = "github:ryantm/agenix";
    nur.url = "github:nix-community/NUR";
    nur.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, home-manager, plasma-manager, jovian, nur, ... }:
  let
    modules = import ./modules.nix;
    system = "x86_64-linux";
    lib = nixpkgs.lib;
    pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true;
    };

    systemModules = [
      home-manager.nixosModules.home-manager
      jovian.nixosModules.jovian
      nur.modules.nixos.default
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
            modules.system.base ++
            modules.system.cpu.amd ++
            modules.system.filesystem.client ++
            modules.system.gpu.amd ++
            modules.system.plasma ++
            modules.system.sddm ++
            modules.system.gaming [
              {
                home-manager.users.${user}.imports =
                  modules.user.base ++
                  modules.user.plasma ++
                  modules.user.gaming;
                home-manager.extraSpecialArgs = { inherit user; inherit hostName; };
                home-manager.sharedModules = userModules;
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
            modules.system.base ++
            modules.system.cpu.amd ++
            modules.system.filesystem.client ++
            modules.system.plasma ++
            modules.system.gaming ++
            modules.system.jovian.konsole ++ [
              {
                home-manager.users.${user}.imports =
                  modules.user.base ++
                  modules.user.plasma ++
                  modules.user.gaming;
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
            modules.system.base ++
            modules.system.cpu.amd ++
            modules.system.filesystem.client ++
            modules.system.plasma ++
            modules.system.gaming ++
            modules.system.jovian.steamdeck ++ [
              {
                home-manager.users.${user}.imports =
                  modules.user.base ++
                  modules.user.plasma ++
                  modules.user.gaming;
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
            modules.system.base ++
            modules.system.cpu.intel ++
            modules.system.container ++
            modules.system.filesystem.server ++ [
              {
                home-manager.users.${user}.imports =
                  modules.user.base;
                home-manager.extraSpecialArgs = { inherit user; inherit hostName; };
                home-manager.sharedModules = userModules;
              }
            ];
        };
    };
  };
}
