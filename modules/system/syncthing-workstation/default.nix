{ user, ... }:
{
networking.firewall.allowedTCPPorts = [ 8384 22000 ];
networking.firewall.allowedUDPPorts = [ 22000 21027 ];
services = {
  syncthing = {
    enable = true;
    user = "root";
    dataDir = "/${user}/sync";
    configDir = "/${user}/syncthing";
    overrideDevices = true;
    overrideFolders = true;
    settings = {
      devices = {
        "steamdeck" = { id = "FRVFN5U-CAJCDOR-CXOCKGI-FHHVCYP-MYVCVPK-LN53JOU-YFYB5HZ-5W4IMAW"; };
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
