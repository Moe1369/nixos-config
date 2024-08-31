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
        "workstation" = { id = "3TLJKSV-QURWERW-PZ7FUI4-LXL22PU-CFXXWRN-UBWTSPK-BJLHVWD-VMHEOQ2"; };
      };
      folders = {
        "Decky-Loader" = {
          path = "/var/lib/decky-loader";
          devices = [ "workstation" ];
        };
      };
    };
  };
};
}
