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
    enableControllerUdevRules = true;
    enableDefaultCmdlineConfig = true;
    enableDefaultStage1Modules = true;
    enableFwupdBiosUpdates = true;
    enableGyroDsuService = true;
    enableKernelPatches = true;
    enableOsFanControl = true;
    enablePerfControlUdevRules = true;
    enableSoundSupport = true;
    enableXorgRotation = true;
  };
}
