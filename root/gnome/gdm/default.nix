# Gnome Display Manager.
{ user, ... }:
{
# Enable GDM only on workstation.
services.xserver = lib.mkIf (config.networking.hostName == "workstation") {
    displayManager.gdm.enable = true;
};
# Autologin only on workstation. Not needed on konsole or steamdeck. Jovian Greeter is being used.
services.displayManager = lib.mkIf (config.networking.hostName == "workstation") {
    autoLogin.enable = true;
    autoLogin.user = user;
};
}
