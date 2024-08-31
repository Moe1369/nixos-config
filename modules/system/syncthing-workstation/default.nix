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
        "steamdeck" = { id = "WOVNOIM-PCQX56E-WUWRCFO-7JFBAWF-QCE564I-4KXAHYW-ONZHHOT-DPHCEQ6"; };
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
