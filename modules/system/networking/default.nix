{ lib,  hostName, ... }:
{
  networking.hostName = hostName;
  networking.useDHCP = lib.mkDefault true;
  networking.networkmanager.enable = true;
}
