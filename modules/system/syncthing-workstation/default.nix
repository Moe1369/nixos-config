{ user, ... }:
{
networking.firewall.allowedTCPPorts = [ 8384 22000 ];
networking.firewall.allowedUDPPorts = [ 22000 21027 ];
services = {
  syncthing = {
    enable = true;
    user = user;
    dataDir = "/home/${user}/sync";
    configDir = "/home/${user}/.config/syncthing";
    overrideDevices = true;
    overrideFolders = true;
    settings = {
      devices = {
        "steamdeck" = { id = "G75YXSQ-GBB2F3T-25G4WNI-YYR3NFO-6DRWLPC-CDYEOCZ-QXRGSSA-E4MP7QT"; };
      };
      folders = {
        "Decky-Loader" = {
          path = "/var/lib/decky-loader";
          devices = [ "steamdeck"];
        };
      };
    };
  };
};
}
