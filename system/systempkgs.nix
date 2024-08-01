{ config, pkgs, pkgs-stable, ... }:
{
  programs.firefox = {
    enable = true;
    languagePacks = ["de"];
  };
  environment.systemPackages =
   (with pkgs; [
    ])

    ++

   (with pkgs-stable; [
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
    nil
    citrix_workspace
    ]);
}
