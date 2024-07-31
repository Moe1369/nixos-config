{ config, pkgs, pkgs-stable, jovian, ... }:
{
  jovian.steam = {
    enable = true;
    autoStart = true;
    user = "mo";
    desktopSession = "plasma";
  };

  jovian.decky-loader.enable = true;
  jovian.decky-loader.user = "mo";
  jovian.hardware.has.amd.gpu = true;
  jovian.hardware.amd.gpu.enableEarlyModesetting = true;
  jovian.steamos.enableBluetoothConfig = true;

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };
}
