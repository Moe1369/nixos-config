{
  description = "Moe.OS";
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
    jovian = {
      url = "github:Jovian-Experiments/Jovian-NixOS/development";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, plasma-manager, jovian, nur, ... }:
  let
    groups = import ./groups.nix;
    modules.system.external = [
      home-manager.nixosModules.home-manager
      jovian.nixosModules.jovian
      nur.modules.nixos.default
    ];
    modules.user.external = [
      plasma-manager.homeManagerModules.plasma-manager
    ];
    system = "x86_64-linux";
    lib = nixpkgs.lib;
    pkgs = import nixpkgs {inherit system;};
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
            modules.system.external ++
            groups.system.base ++
            groups.system.cpu.amd ++
            groups.system.filesystem.client ++
            groups.system.jovian.workstation ++
            groups.system.plasma ++
            groups.system.sddm ++
            groups.system.gaming ++ [
              {
                home-manager.users.${user}.imports =
                  groups.user.base ++
                  groups.user.plasma ++
                  groups.user.gaming;
                home-manager.extraSpecialArgs = { inherit user; inherit hostName; };
                home-manager.sharedModules = modules.user.external;
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
            modules.system.external ++
            groups.system.base ++
            groups.system.cpu.amd ++
            groups.system.filesystem.client ++
            groups.system.plasma ++
            groups.system.gaming ++
            groups.system.jovian.konsole ++ [
              {
                home-manager.users.${user}.imports =
                  groups.user.base ++
                  groups.user.plasma ++
                  groups.user.gaming;
                home-manager.extraSpecialArgs = { inherit user; inherit hostName; };
                home-manager.sharedModules = modules.user.external;
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
            modules.system.external ++
            groups.system.base ++
            groups.system.cpu.amd ++
            groups.system.filesystem.client ++
            groups.system.plasma ++
            groups.system.gaming ++
            groups.system.jovian.steamdeck ++ [
              {
                home-manager.users.${user}.imports =
                  groups.user.base ++
                  groups.user.plasma ++
                  groups.user.gaming;
                home-manager.extraSpecialArgs = { inherit user; inherit hostName; };
                home-manager.sharedModules = modules.user.external;
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
            modules.system.external ++
            groups.system.base ++
#            groups.system.cpu.intel ++
            groups.system.services ++
            groups.system.filesystem.server ++ [
              {
                home-manager.users.${user}.imports =
                  groups.user.base;
                home-manager.extraSpecialArgs = { inherit user; inherit hostName; };
                home-manager.sharedModules = modules.user.external;
              }
            ];
        };
    };
  };
}
