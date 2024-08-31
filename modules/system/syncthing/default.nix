{ user, ... }:
{
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
        "steamdeck" = { id = "WOVNOIM-PCQX56E-WUWRCFO-7JFBAWF-QCE564I-4KXAHYW-ONZHHOT-DPHCEQ6"; };
      };
      folders = {
        "Decky-Loader" = {
          path = "/var/lib/decky-loader";
          devices = [ "workstation" "steamdeck"];
        };
      };
    };
  };
};
}
