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
    groups = import ./groups.nix;
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
            groups.system.base ++
            groups.system.filesystem ++
            groups.system.plasma ++
            groups.system.sddm ++
            groups.system.gaming ++
            groups.system.jovian.workstation ++ [
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

      konsole =
        let
          user = "mo";
          hostName = "konsole";
        in
        lib.nixosSystem {
          specialArgs = { inherit user; inherit hostName; inherit system; };
          modules =
            systemModules ++
            groups.system.base ++
            groups.system.filesystem ++
            groups.system.plasma ++
            groups.system.gaming ++
            groups.system.jovian.konsole ++ [
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
            groups.system.base ++
            groups.system.filesystem ++
            groups.system.plasma ++
            groups.system.gaming ++
            groups.system.jovian.steamdeck ++ [
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
    };
  };
}
