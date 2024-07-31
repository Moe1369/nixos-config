{ config, pkgs, pkgs-stable, ... }:
{
  services.xserver.enable = false;
  services.desktopManager.plasma6.enable = true;
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "mo";
}
