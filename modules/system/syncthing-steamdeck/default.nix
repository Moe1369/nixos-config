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
        "workstation" = { id = "JKW7OC4-WUQJS3V-M7UYBCI-2T52P5L-HT5GP6F-FDANKRZ-SFBOJ2S-6G5A4QQ"; };
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
