# Home Manager Settings.
{ home-manager, pkgs, ... }:
{
    home-manager.useGlobalPkgs = true;
    home-manager.useUserPackages = true;
    home-manager.extraSpecialArgs = { inherit pkgs; };
    # File extension for conflicting files.
    home-manager.backupFileExtension = "backup";
}
