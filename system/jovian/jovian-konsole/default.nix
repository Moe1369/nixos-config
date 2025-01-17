{ user, ... }:
{
  jovian.steam.enable = true;
  jovian.steam.autoStart = true;
  jovian.steam.user = user;
  jovian.steam.desktopSession = "plasma";
  jovian.decky-loader.enable = true;
  jovian.decky-loader.user = user;
  jovian.hardware.amd.gpu.enableEarlyModesetting = true;
  jovian.steamos.enableBluetoothConfig = true;
}
