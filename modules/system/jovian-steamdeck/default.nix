{ user, ... }:
{
  jovian.steam = {
    enable = true;
    autoStart = true;
    user = user;
    desktopSession = "plasma";
  };
  jovian.decky-loader.enable = true;
  jovian.hardware.amd.gpu.enableEarlyModesetting = true;
  jovian.decky-loader.user = user;
  jovian.devices.steamdeck = {
    enable = true;
    autoUpdate = true;
  };
}
