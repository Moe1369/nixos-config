{ user, ... }:
{
services.xserver.displayManager.gdm.enable = true;
services.displayManager.autoLogin.enable = true;
services.displayManager.autoLogin.user = user;

}
