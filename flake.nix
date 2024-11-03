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
    jovian.url = "github:Jovian-Experiments/Jovian-NixOS/development";
    agenix.url = "github:ryantm/agenix";
    nur.url = "github:nix-community/NUR";

  };
  outputs = { nixpkgs, home-manager, plasma-manager, jovian, nur, ... }:
  let
    system = "x86_64-linux";
    #pkgs = import nixpkgs { inherit system; };
    lib = nixpkgs.lib;
    externalSystemModules = [
      home-manager.nixosModules.home-manager
      jovian.nixosModules.jovian
      nur.nixosModules.nur
      ];
    externalUserModules = [ plasma-manager.homeManagerModules.plasma-manager ];
    baseSystemModules = hostName:[
        ./hosts/${hostName}
        ./modules/system/apps-shell
        ./modules/system/boot
        ./modules/system/devices
        ./modules/system/home-manager
        ./modules/system/locale
        ./modules/system/networking
        ./modules/system/nixsettings
        ./modules/system/shell
        ./modules/system/ssh
        ./modules/system/systemversion
        ./modules/system/upgrades
        ./modules/system/users
    ];
    desktopSystemModules = hostName:[
        ./modules/system/apps-misc
        ./modules/system/browser
        ./modules/system/plasma
        ./modules/system/plasma-nur
    ];
    displaySystemModules = hostName:[
        ./modules/system/sddm
    ];
    gamingSystemModules = hostName:[
        ./modules/system/controller
        ./modules/system/jovian-${hostName}
        ./modules/system/lact
        ./modules/system/steam
    ];

    serverSystemModules = hostName:[
        ./modules/system/docker
    ];
    baseUserModules = hostName:[
        ./modules/user/git
        ./modules/user/homeversion
        ./modules/user/shell
    ];
    desktopUserModules = hostName:[
        ./modules/user/plasma
    ];
    gamingUserModules = hostName:[
        ./modules/user/steam
    ];
    serverUserModules = hostName:[];
  in
  {
    nixosConfigurations = {
      workstation =
        let
          user = "mo";
          hostName = "workstation";
        in
        lib.nixosSystem {
          specialArgs = {inherit user; inherit hostName; inherit system;};
          modules = (externalSystemModules hostName) ++ (baseSystemModules hostName) ++ (desktopSystemModules hostName) ++ (displaySystemModules hostName) ++ (gamingSystemModules hostName) ++ [
            {
              home-manager.users.${user}.imports = (baseUserModules hostName) ++ (desktopUserModules hostName) ++ (gamingUserModules hostName)++ [
              ];
              home-manager.extraSpecialArgs = { inherit user; inherit hostName;};
              home-manager.sharedModules =  externalUserModules;
            }
          ];
        };
      konsole =
        let
          user = "mo";
          hostName = "konsole";
        in
        lib.nixosSystem {
          specialArgs = {inherit user; inherit hostName; inherit system;};
          modules = (externalSystemModules hostName) ++ (baseSystemModules hostName) ++ (desktopSystemModules hostName) ++ (gamingSystemModules hostName) ++ [
            {
              home-manager.users.${user}.imports = (baseUserModules hostName) ++ (desktopUserModules hostName) ++ (gamingUserModules hostName) ++ [
              ];
              home-manager.extraSpecialArgs = { inherit user; inherit hostName;};
              home-manager.sharedModules =  externalUserModules;
            }
          ];
        };
      steamdeck =
        let
          user = "deck";
          hostName = "steamdeck";
        in
        lib.nixosSystem {
          specialArgs = {inherit user; inherit hostName; inherit system;};
          modules = (externalSystemModules hostName) ++ (baseSystemModules hostName) ++ (desktopSystemModules hostName) ++ (gamingSystemModules hostName) ++ [
            {
              home-manager.users.${user}.imports = (baseUserModules hostName) ++ (desktopUserModules hostName) ++ (gamingUserModules hostName) ++ [
              ];
              home-manager.extraSpecialArgs = { inherit user; inherit hostName;};
              home-manager.sharedModules =  externalUserModules;
            }
          ];
        };
      server =
        let
          user = "administrator";
          hostName = "server";
        in
        lib.nixosSystem {
          specialArgs = {inherit user; inherit hostName; inherit system;};
          modules = externalSystemModules ++ (baseSystemModules hostName) ++ (serverSystemModules hostName) ++ [
            {
              home-manager.users.${user}.imports = (baseUserModules hostName) ++ (serverUserModules hostName) ++ [
              ];
              home-manager.extraSpecialArgs = { inherit user; inherit hostName;};
              home-manager.sharedModules =  externalUserModules;
            }
          ];
        };
    };
  };
}
