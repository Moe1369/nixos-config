{
  description = "Moe.OS";
  # Define Inputs
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    jovian.url = "github:Jovian-Experiments/Jovian-NixOS/development";
    plasma-manager = {
      url = "github:nix-community/plasma-manager/trunk";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
  };
  # Define Outputs, import Modules
  outputs = { nixpkgs, home-manager, jovian, plasma-manager, ...}:
  let
    # Define system globally since I have no aarch devices
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system;};
    lib = nixpkgs.lib;
    # NixOS Modules for all hosts
    systemModules = [
      home-manager.nixosModules.home-manager
      ./modules/system/apps-shell
      ./modules/system/boot
      ./modules/system/devices
      ./modules/system/locale
      ./modules/system/networking
      ./modules/system/nixsettings
      ./modules/system/shell
      ./modules/system/systemversion
      ./modules/system/upgrades
      ./modules/system/users
    ];
    # Home Manager Modules for all hosts
    userModules = [
      ./modules/user/git
      ./modules/user/homeversion
    ];
  in
  {

    nixosConfigurations = {
      # user and hostName variable inside hostConfig so we can call it in other modules
      computer-mo = let
      user = "mo";
      hostName = "computer-mo";
      in lib.nixosSystem {
        specialArgs = {inherit systemModules; inherit userModules; inherit system; inherit user; inherit hostName;};
        system = system;
        # Device specific NixOS Modules
        modules = systemModules ++ [
          jovian.nixosModules.jovian
          ./hosts/${hostName}
          ./modules/system/apps-misc
          ./modules/system/browser
          ./modules/system/controller
          ./modules/system/jovian-desktop
          ./modules/system/lact
          ./modules/system/plasma
          ./modules/system/steam
          {
            # Device specific Home Manager Modules
            home-manager.users.${user}.imports = userModules ++ [
            ./modules/user/plasma
            ];
            # Issue with Plasma Manager, has to be imported in a special way
            home-manager.sharedModules = [ plasma-manager.homeManagerModules.plasma-manager ];
          }
        ];
      };
    };
  };
}
