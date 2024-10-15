{ pkgs, ... }:
{
# Workaround for Warhammer Login Issue
  security.pki.certificateFiles = [ ../../../dotfiles/api.neocoregames.com.cert ];

  nixpkgs.config.packageOverrides = pkgs: {
    steam = pkgs.steam.override {
      extraPkgs = pkgs: with pkgs; [
        xorg.libXcursor
        xorg.libXi
        xorg.libXinerama
        xorg.libXScrnSaver
        libpng
        libpulseaudio
        libvorbis
        stdenv.cc.cc.lib
        libkrb5
        keyutils
      ];
    };
  };
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };
  environment.systemPackages =
   (with pkgs; [
    gamescope
    jq
    jql
    python312Packages.jq
    mangohud
    protonup-qt
    ]);
}
