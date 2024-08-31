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
        "workstation" = { id = "3ZJ5HJI-MEYRN5Y-WHA4CAB-M3WI33G-CFNUSXK-G6RQMFZ-C3QNCV4-JM7LPAO"; };
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
