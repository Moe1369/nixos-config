{ pkgs, ... }:
{
  environment.systemPackages =
   (with pkgs; [
    ibm-plex
    pciutils
    aha
    vesktop
    google-chrome
    teams-for-linux
    ]);
}
