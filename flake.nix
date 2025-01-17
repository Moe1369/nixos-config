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
    
    system = "x86_64-linux";
    lib = nixpkgs.lib;
    pkgs = import nixpkgs {inherit system;};

    root.base = lib.filter (n: lib.strings.hasSuffix ".nix" n) (lib.filesystem.listFilesRecursive ./root/base);
    root.desktop = lib.filter (n: lib.strings.hasSuffix ".nix" n) (lib.filesystem.listFilesRecursive ./root/desktop);
    root.filesystem.client = lib.filter (n: lib.strings.hasSuffix ".nix" n) (lib.filesystem.listFilesRecursive ./root/filesystem/client);  
    root.filesystem.server = lib.filter (n: lib.strings.hasSuffix ".nix" n) (lib.filesystem.listFilesRecursive ./root/filesystem/server);  
    root.gaming = lib.filter (n: lib.strings.hasSuffix ".nix" n) (lib.filesystem.listFilesRecursive ./root/gaming);
    root.gnome = lib.filter (n: lib.strings.hasSuffix ".nix" n) (lib.filesystem.listFilesRecursive ./root/gnome);
    root.jovian = lib.filter (n: lib.strings.hasSuffix ".nix" n) (lib.filesystem.listFilesRecursive ./root/jovian);
    root.plasma = lib.filter (n: lib.strings.hasSuffix ".nix" n) (lib.filesystem.listFilesRecursive ./root/plasma);
    root.services = lib.filter (n: lib.strings.hasSuffix ".nix" n) (lib.filesystem.listFilesRecursive ./root/services);

    home.base = lib.filter (n: lib.strings.hasSuffix ".nix" n) (lib.filesystem.listFilesRecursive ./home/base);
    home.gaming = lib.filter (n: lib.strings.hasSuffix ".nix" n) (lib.filesystem.listFilesRecursive ./home/gaming);
    home.gnome = lib.filter (n: lib.strings.hasSuffix ".nix" n) (lib.filesystem.listFilesRecursive ./home/gnome);
    home.plasma = lib.filter (n: lib.strings.hasSuffix ".nix" n) (lib.filesystem.listFilesRecursive ./home/plasma);
    
    root.external = [
      home-manager.nixosModules.home-manager
      jovian.nixosModules.jovian
      nur.modules.nixos.default
    ];

    home.external = [
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
            root.external ++
            root.base ++
            root.cpu.amd ++
            root.filesystem.client ++
            root.jovian ++
            root.plasma ++
            root.sddm ++
            root.gaming ++ [
              {
                home-manager.extraSpecialArgs = { inherit user; inherit hostName; };
                home-manager.users.${user}.imports =
                  home.base ++
                  home.plasma ++
                  home.gaming;
                home-manager.sharedModules = home.external;
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
            root.external ++
            root.base ++
            root.filesystem.client ++
            root.plasma ++
            root.gaming ++
            root.jovian ++ [
              {
                home-manager.extraSpecialArgs = { inherit user; inherit hostName; };
                home-manager.users.${user}.imports =
                  home.base ++
                  home.plasma ++
                  home.gaming;
                home-manager.sharedModules = home.external;
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
            root.external ++
            root.base ++
            root.filesystem.client ++
            root.plasma ++
            root.gaming ++
            root.jovian ++ [
              {
                home-manager.extraSpecialArgs = { inherit user; inherit hostName; };
                home-manager.users.${user}.imports =
                  home.base ++
                  home.plasma ++
                  home.gaming;
                home-manager.sharedModules = home.external;
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
            root.external ++
            root.base ++
            root.services ++
            root.filesystem.server ++ [
              {
                home-manager.extraSpecialArgs = { inherit user; inherit hostName; };
                home-manager.users.${user}.imports =
                  home.base;
                home-manager.sharedModules = home.external;
              }
            ];
        };
    };
  };
}
