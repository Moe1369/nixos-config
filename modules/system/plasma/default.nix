{ user, pkgs, ... }:
{
  services.desktopManager.plasma6.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.displayManager.sddm.enable = true;
  services.xserver.enable = false;
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = user;

  environment.systemPackages =
   (with pkgs; [
    kde-rounded-corners
    kdePackages.kate
    kdePackages.isoimagewriter
    kdePackages.gwenview
    kdePackages.okular
    kdePackages.kdenlive
    kdePackages.elisa
    haruna
    krita
    kdePackages.kcolorchooser
    xwaylandvideobridge
    kdePackages.kfind
    kdePackages.kcalc
    kdePackages.filelight
    kdePackages.skanlite
    kdePackages.ksystemlog
    kdePackages.partitionmanager
    ]);
}
