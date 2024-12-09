{ user, ... }:
{
  #substituters = https://jovian-nixos.cachix.org;
  #trusted-public-keys = jovian-nixos.cachix.org-1:mAWLjAxLNlfxAnozUjOqGj4AxQwCl7MXwOfu7msVlAo=;

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
