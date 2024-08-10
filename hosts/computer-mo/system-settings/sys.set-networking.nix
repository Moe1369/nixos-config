{ lib, host,  ... }:
{
  networking.useDHCP = lib.mkDefault true;
  networking.hostName = host;
  networking.networkmanager.enable = true;
}
