{ user, ... }:
{
  services.xserver.enable = false;
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = user;
}
