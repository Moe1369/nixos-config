{ config, pkgs, pkgs-stable, ... }:
{
  programs.firefox = {
    enable = true;
    languagePacks = ["de"];
  };
  environment.systemPackages =
   (with pkgs; [
    mangohud
    lact
    gpu-screen-recorder
    ])

    ++

   (with pkgs-stable; [
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
    krita
    haruna
    vesktop
    bitwarden-desktop
    git
    pciutils
    aha
    neofetch
    ibm-plex
    nil
    ]);
}
