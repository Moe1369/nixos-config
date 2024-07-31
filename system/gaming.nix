{ config, pkgs, pkgs-stable, jovian ... }:
{
  jovian.steam.enable = true;
  jovian.steam.autoStart = true;
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };
}
