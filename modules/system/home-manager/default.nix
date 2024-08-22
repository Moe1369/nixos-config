{ home-manager, pkgs, ... }:
{
    home-manager.useGlobalPkgs = true;
    home-manager.useUserPackages = true;
    home-manager.extraSpecialArgs = { inherit pkgs; };
    home-manager.backupFileExtension = "backup";
}
