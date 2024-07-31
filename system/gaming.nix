{ config, pkgs, pkgs-stable, jovian, ... }:
{
  jovian.steam = {
    enable = true;
    autoStart = false;
    user = "mo";
    desktopSession = "plasma";
  };

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };
}
