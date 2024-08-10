# Steam and Jovian Packages used for Gamescope Session and Desktop Steam
{ ... }:
{
  jovian.steam = {
    enable = true;
    autoStart = false;
    user = "mo";
    desktopSession = "plasma";
  };

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
