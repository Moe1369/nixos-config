{ user, ... }:
{
services.xserver.displayManager.gdm.enable = true;
services.xserver.displayManager.autoLogin.enable = true;
services.xserver.displayManager.autoLogin.user = user;

}
