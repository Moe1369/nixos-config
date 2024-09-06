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
        "workstation" = { id = "HSQA3YR-AEELJUK-6DBFSRH-EAQAV7C-NYW77N4-4NRLTOP-OCQBFXQ-QD2JFAM"; };
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
