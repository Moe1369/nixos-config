# Jovian Experiments for SteamOS like experience.
{ user, hostName, lib, config, ... }:
{
  jovian.steam.enable = true;
  jovian.steam.autoStart = true;
  jovian.steam.user = user;
  # Needs installed desktop session to make "Return to Desktop" work.
  jovian.steam.desktopSession = "plasma";
  jovian.decky-loader.enable = true;
  jovian.decky-loader.user = user;
  jovian.steam.updater.splash = "steamos";
  jovian.hardware.amd.gpu.enableEarlyModesetting = true;
  jovian.steamos.enableBluetoothConfig = true;
  # Conditional setting. Only install drivers on steamdeck. 
  jovian.devices.steamdeck = lib.mkIf (config.networking.hostName == "steamdeck") {
    enable = true;
  };
}
