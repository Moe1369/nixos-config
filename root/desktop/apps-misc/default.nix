# Normal desktop programs for both gnome and plasma.
{ pkgs, ... }:
{
  environment.systemPackages =
   (with pkgs; [
    ibm-plex
    pciutils
    aha
    vesktop
    ]);
}
