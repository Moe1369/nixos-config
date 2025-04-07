{ user, lib, hostName, config, ... }:
{
  # Only use sddm on Computer-Mo.
  services.displayManager = lib.mkIf (config.networking.hostName == "Computer-Mo") {
    sddm.wayland.enable = true;
    sddm.enable = true;
    autoLogin.enable = true;
    autoLogin.user = user;
  };
}
