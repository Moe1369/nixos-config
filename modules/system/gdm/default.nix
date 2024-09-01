{ user, ... }:
{
  services.displayManager.gdm.wayland.enable = true;
  services.displayManager.gdm.enable = true;
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = user;
}
