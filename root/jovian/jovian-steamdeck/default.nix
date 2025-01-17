{ user, hostName, lib, ... }:
{
  jovian.steam.enable = true;
  jovian.steam.autoStart = true;
  jovian.steam.user = user;
  jovian.steam.desktopSession = "plasma";
  jovian.decky-loader.enable = true;
  jovian.decky-loader.user = user;
  jovian.steam.updater.splash = "steamos";
  jovian.hardware.amd.gpu.enableEarlyModesetting = true;
  jovian.steamos.enableBluetoothConfig = true;
  jovian.devices.steamdeck = lib.mkIf (config.networking.hostName == "steamdeck") {
    enable = true;
  };
  #jovian.devices.steamdeck.enable = true;
}
