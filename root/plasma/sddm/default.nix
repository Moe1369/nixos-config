{ user, lib, hostName, config, ... }:
{
  # Only use sddm on workstation.
  services.displayManager = lib.mkIf (config.networking.hostName == "workstation") {
    sddm.wayland.enable = true;
    sddm.enable = true;
    autoLogin.enable = true;
    autoLogin.user = user;
  };

}
