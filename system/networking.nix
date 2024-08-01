{ config, pkgs, pkgs-stable, ... }:
{
  networking.hostName = "computer-mo";
  networking.networkmanager.enable = true;
}
