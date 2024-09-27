{ user, ... }:
{
  jovian.steam = {
    enable = true;
    autoStart = true;
    user = user;
    desktopSession = "plasma";
  };
  jovian.decky-loader.enable = true;
  jovian.decky-loader.user = user;
  jovian.steamos.enableBluetoothConfig = true;
}
