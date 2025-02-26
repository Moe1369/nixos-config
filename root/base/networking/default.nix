# Simple networking settings. Uses DHCP.
{ lib,  hostName, ... }:
{
  networking.hostName = hostName;
  networking.useDHCP = lib.mkDefault true;
  networking.networkmanager.enable = true;
  networking.interfaces.enp11s0.wakeOnLan.enable = true;
}
