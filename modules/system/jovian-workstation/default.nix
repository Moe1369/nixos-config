{ user, ... }:
{
  jovian.steam.enable = true;
  jovian.steam.autoStart = false;
  jovian.steam.user = user;
  jovian.steam.desktopSession = "gnome";
  jovian.decky-loader.enable = false;
  jovian.hardware.amd.gpu.enableEarlyModesetting = true;
  jovian.steamos.enableBluetoothConfig = true;
}
