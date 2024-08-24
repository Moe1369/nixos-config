{ pkgs, ... }:
{
  environment.systemPackages =
   (with pkgs; [
    ibm-plex
    mangohud
    pciutils
    aha
    vesktop
    google-chrome
    teams-for-linux
    protonup-qt
    ]);
}
