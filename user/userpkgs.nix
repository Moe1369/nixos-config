{ config, pkgs, pkgs-unstable,... }:
{
  environment.systemPackages = with pkgs; [
    wget
    git
    vesktop
    bitwarden-desktop
    kdePackages.kate
    kdePackages.gwenview
    kdePackages.okular
    kdePackages.kontact
    haruna
    pciutils
    aha
    neofetch
    mangohud
    ibm-plex
  ];
}
