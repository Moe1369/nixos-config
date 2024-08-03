{ config, pkgs, pkgs-stable, jovian, ... }:
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
    gamescopeSession.enable = true;
    gamescopeSession.args = ["-W 3440" "-H 1440" "-r 175" "-f" "--hdr-enabled"];
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };
}
