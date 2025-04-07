# Normal desktop programs for both gnome and plasma.
{ pkgs, ... }:
{
  environment.systemPackages =
   (with pkgs; [
    ibm-plex
    adwaita-fonts
    pciutils
    aha
    vesktop
    obs-studio
    teams-for-linux
    ]);
}
