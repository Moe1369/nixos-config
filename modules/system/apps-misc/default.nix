{ pkgs, ... }:
{
  environment.systemPackages =
   (with pkgs; [
    ibm-plex
    mangohud
    pciutils
    aha
    lact
    vesktop
    google-chrome
    teams-for-linux
    ]);
}
