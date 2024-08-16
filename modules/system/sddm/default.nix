{ user, ... }:
{
  services.displayManager.sddm.wayland.enable = true;
  services.displayManager.sddm.enable = true;
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = user;
}
