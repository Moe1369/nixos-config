{ pkgs, ... }:
{
  services.desktopManager.plasma6.enable = true;
  services.xserver.enable = false;

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