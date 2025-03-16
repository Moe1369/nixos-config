{ user, ... }:
{
  jovian.steam.enable = true;
  jovian.steam.autoStart = true;
  jovian.steam.user = user;
  jovian.steam.desktopSession = "plasma";
  jovian.decky-loader.enable = true;
  jovian.decky-loader.user = user;
  jovian.steamos.enableBluetoothConfig = true;
}
