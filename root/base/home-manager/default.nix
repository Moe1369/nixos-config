# Home Manager Settings.
{ pkgs, user, hostName, ... }:
{
    home-manager.useGlobalPkgs = true;
    home-manager.useUserPackages = true;
    home-manager.extraSpecialArgs = { inherit pkgs; inherit user; inherit hostName; };
    home-manager.backupFileExtension = "backup";
}
