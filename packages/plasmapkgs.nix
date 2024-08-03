{ config, pkgs, pkgs-stable, ... }:
{
  environment.systemPackages =
   (with pkgs; [
    kdePackages.kate
    kdePackages.gwenview
    kdePackages.okular
    kdePackages.kdenlive
    kdePackages.partitionmanager
    kdePackages.kfind
    kdePackages.kcalc
    kdePackages.filelight
    kdePackages.skanlite
    kdePackages.ksystemlog
    kdePackages.kcolorchooser
    kdePackages.elisa
    xwaylandvideobridge
    krita
    haruna
    ])

    ++

   (with pkgs-stable; [

    ]);
}
