{ user, ... }:
{
services = {
  syncthing = {
    enable = true;
    user = "root";
    dataDir = "/${user}/Sync";
    configDir = "/${user}/.config/syncthing";
    overrideDevices = true;
    overrideFolders = true;
    settings = {
      devices = {
        "workstation" = { id = "3TLJKSV-QURWERW-PZ7FUI4-LXL22PU-CFXXWRN-UBWTSPK-BJLHVWD-VMHEOQ2"; };
       # "device2" = { id = "DEVICE-ID-GOES-HERE"; };
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
