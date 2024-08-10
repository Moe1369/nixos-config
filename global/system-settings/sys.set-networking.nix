{ lib, host,  ... }:
{
  networking.useDHCP = lib.mkDefault true;
  networking.networkmanager.enable = true;
}
