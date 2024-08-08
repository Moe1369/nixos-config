{ pkgs, pkgs-stable, ... }:
{
  environment.systemPackages =
   (with pkgs; [
    google-chrome
    teams-for-linux
    kdePackages.kcolorchooser
    xwaylandvideobridge
    kdePackages.kfind
    kdePackages.kcalc
    kdePackages.filelight
    kdePackages.skanlite
    ])

    ++

   (with pkgs-stable; [

    ]);
}
