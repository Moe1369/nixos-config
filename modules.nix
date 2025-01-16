{
system = {
    external = [
      home-manager.nixosModules.home-manager
      jovian.nixosModules.jovian
      nur.modules.nixos.default
      ];
};
user = {
    external = [
      plasma-manager.homeManagerModules.plasma-manager
      ];
};
}