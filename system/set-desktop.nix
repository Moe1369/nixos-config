{ ... }:
{
  services.xserver.enable = false;
  services.desktopManager.plasma6.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.displayManager.sddm.enable = true;
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "mo";
}
