{ user, ... }:
{
services.xserver = lib.mkIf (config.networking.hostName == "workstation") {
    displayManager.gdm.enable = true;
};
services.displayManager = lib.mkIf (config.networking.hostName == "workstation") {
    autoLogin.enable = true;
    autoLogin.user = user;
};
}
