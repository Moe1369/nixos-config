{ config, pkgs, pkgs-stable, ... }:
{
  programs.firefox = {
    enable = true;
    languagePacks = ["de"];
  };
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
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
    citrix_workspace
  ];
}
