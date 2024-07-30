{ config, pkgs, pkgs-stable, ... }:
{
  programs.firefox = {
    enable = true;
    languagePacks = ["de"];
  };
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
    gamescopeSession.enable = true;
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
    alpaca
  ];
    pkgs.alpaca.override.ollama = pkgs.ollama-rocm;
}
