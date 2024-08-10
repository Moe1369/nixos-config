{ lib, ... }:
{
  networking.useDHCP = lib.mkDefault true;
  networking.hostName = "computer-mo";
  networking.networkmanager.enable = true;
}
