{ user, ... }:
{
  jovian.steam = {
    enable = true;
    autoStart = true;
    user = user;
    desktopSession = "plasma";
  };
  jovian.decky-loader.enable = true;
  jovian.devices.steamdeck = {
    enable = true;
    autoUpdate = true;
  };
}