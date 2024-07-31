 { config, pkgs, pkgs-unstable, ... }:
{
  networking.hostName = "computer-mo";
  networking.networkmanager.enable = true;
}
