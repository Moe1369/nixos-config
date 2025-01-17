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

  system.base = lib.filter (n: lib.strings.hasSuffix ".nix" n) (lib.filesystem.listFilesRecursive ./system/base);
  system.desktop = lib.filter (n: lib.strings.hasSuffix ".nix" n) (lib.filesystem.listFilesRecursive ./system/desktop);
  system.filesystem.client = lib.filter (n: lib.strings.hasSuffix ".nix" n) (lib.filesystem.listFilesRecursive ./system/filesystem/client);  system.filesystem.server = lib.filter (n: lib.strings.hasSuffix ".nix" n) (lib.filesystem.listFilesRecursive ./system/filesystem/server);  system.gaming = lib.filter (n: lib.strings.hasSuffix ".nix" n) (lib.filesystem.listFilesRecursive ./system/gaming);
  system.gnome = lib.filter (n: lib.strings.hasSuffix ".nix" n) (lib.filesystem.listFilesRecursive ./system/gnome);
  system.jovian = lib.filter (n: lib.strings.hasSuffix ".nix" n) (lib.filesystem.listFilesRecursive ./system/jovian);
  system.microcode = lib.filter (n: lib.strings.hasSuffix ".nix" n) (lib.filesystem.listFilesRecursive ./system/microcode);
  system.plasma = lib.filter (n: lib.strings.hasSuffix ".nix" n) (lib.filesystem.listFilesRecursive ./system/plasma);
  system.services = lib.filter (n: lib.strings.hasSuffix ".nix" n) (lib.filesystem.listFilesRecursive ./system/services);
  user.base = lib.filter (n: lib.strings.hasSuffix ".nix" n) (lib.filesystem.listFilesRecursive ./user/base);
  user.gaming = lib.filter (n: lib.strings.hasSuffix ".nix" n) (lib.filesystem.listFilesRecursive ./user/gaming);
  user.gnome = lib.filter (n: lib.strings.hasSuffix ".nix" n) (lib.filesystem.listFilesRecursive ./user/gnome);
  user.plasma = lib.filter (n: lib.strings.hasSuffix ".nix" n) (lib.filesystem.listFilesRecursive ./user/plasma);

#    groups = import ./groups.nix;
    modules.system.external = [
      home-manager.nixosModules.home-manager
      jovian.nixosModules.jovian
      nur.modules.nixos.default
    ];
    modules.user.external = [
      plasma-manager.homeManagerModules.plasma-manager
    ];
  #  system = "x86_64-linux";
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
            system.base ++
            system.cpu.amd ++
            system.filesystem.client ++
            system.jovian.workstation ++
            system.plasma ++
            system.sddm ++
            system.gaming ++ [
              {
                home-manager.users.${user}.imports =
                  user.base ++
                  user.plasma ++
                  user.gaming;
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
            system.base ++
            system.cpu.amd ++
            system.filesystem.client ++
            system.plasma ++
            system.gaming ++
            system.jovian.konsole ++ [
              {
                home-manager.users.${user}.imports =
                  user.base ++
                  user.plasma ++
                  user.gaming;
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
            system.base ++
            system.cpu.amd ++
            system.filesystem.client ++
            system.plasma ++
            system.gaming ++
            system.jovian.steamdeck ++ [
              {
                home-manager.users.${user}.imports =
                  user.base ++
                  user.plasma ++
                  user.gaming;
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
            system.base ++
#            groups.system.cpu.intel ++
            system.services ++
            system.filesystem.server ++ [
              {
                home-manager.users.${user}.imports =
                  user.base;
                home-manager.extraSpecialArgs = { inherit user; inherit hostName; };
                home-manager.sharedModules = modules.user.external;
              }
            ];
        };
    };
  };
}
