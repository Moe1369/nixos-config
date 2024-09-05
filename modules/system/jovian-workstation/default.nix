{ user, ... }:
{
  jovian.steam = {
    enable = true;
    autoStart = false;
    user = user;
    desktopSession = "plasma";
  };
  jovian.decky-loader.enable = true;
  jovian.decky-loader.user = user;
  #jovian.hardware.has.amd.gpu = true;
  #jovian.hardware.amd.gpu.enableEarlyModesetting = true;
  jovian.steamos.enableBluetoothConfig = true;
}
