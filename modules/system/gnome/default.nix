{ pkgs, ... }:
{
  services.desktopManager.gnome.enable = true;
  services.xserver.enable = false;
}
