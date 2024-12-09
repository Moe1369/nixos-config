{ user, ... }:
{
  imports = [ ../cachix ];
  jovian.steam.enable = true;
  jovian.steam.autoStart = false;
  jovian.steam.user = user;
  jovian.steam.desktopSession = "plasma";
  jovian.decky-loader.enable = false;
  jovian.steam.updater.splash = "steamos";
  jovian.hardware.amd.gpu.enableEarlyModesetting = true;
  jovian.devices.steamdeck.enable = true;
  jovian.devices.steamdeck.autoUpdate = true;
}
