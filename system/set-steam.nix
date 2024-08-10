{ ... }:
{
  jovian.steam = {
    autoStart = false;
    user = "mo";
    desktopSession = "plasma";
  };

  jovian.hardware.has.amd.gpu = true;
  jovian.hardware.amd.gpu.enableEarlyModesetting = true;
  jovian.steamos.enableBluetoothConfig = true;

  programs.steam = {
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };
}
