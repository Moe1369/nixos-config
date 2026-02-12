{ pkgs, user,  ... }:
{
  # Install plasma without xserver. Use wayland.
  services.desktopManager.plasma6.enable = true;
  services.xserver.enable = false;
}
