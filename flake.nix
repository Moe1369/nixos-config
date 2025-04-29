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
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, plasma-manager, nur, ... }:
  let
    
    system = "x86_64-linux";
    lib = nixpkgs.lib;
    pkgs = import nixpkgs {inherit system;};

    filterNixFiles = dir: lib.filter (n: lib.strings.hasSuffix ".nix" n) (lib.filesystem.listFilesRecursive dir);

    root.base = filterNixFiles ./root/base;
    root.desktop = filterNixFiles ./root/desktop;
    root.filesystem.client = filterNixFiles ./root/filesystem/client;
    root.filesystem.server = filterNixFiles ./root/filesystem/server;
    root.gaming.desktop = filterNixFiles ./root/gaming/desktop;
    root.gaming.console = filterNixFiles ./root/gaming/console;
    root.gnome = filterNixFiles ./root/gnome;
    root.hyprland = filterNixFiles ./root/hyprland;
    root.plasma = filterNixFiles ./root/plasma;
    root.services = filterNixFiles ./root/services;

    home.base = filterNixFiles ./home/base;
    home.gaming = filterNixFiles ./home/gaming;
    home.gnome = filterNixFiles ./home/gnome;
    #home.hyprland = filterNixFiles ./home/hyprland;
    home.plasma = filterNixFiles ./home/plasma;
    
    root.external = [
      home-manager.nixosModules.home-manager
      nur.modules.nixos.default
    ];

    home.external = [
      plasma-manager.homeManagerModules.plasma-manager
    ];

  in
  {
    nixosConfigurations = {
      Computer-Mo =
        let
          user = "mo";
          hostName = "Computer-Mo";
        in
        lib.nixosSystem {
          specialArgs = { inherit user; inherit hostName; inherit system; };
          modules =
            root.external ++
            root.base ++
            root.desktop ++
            root.filesystem.client ++
            root.hyprland ++
            root.gaming.desktop ++[
              {
                home-manager.users.${user}.imports =
                  home.base ++
                  home.hyprland ++
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
                home-manager.users.${user}.imports =
                  home.base;
                home-manager.sharedModules = home.external;
              }
            ];
        };
    };
  };
}
