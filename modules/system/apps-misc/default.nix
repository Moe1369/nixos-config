{ pkgs, ... }:
{
  environment.systemPackages =
   (with pkgs; [
    linux-firmware
    ibm-plex
    pciutils
    aha
    vesktop
    ]);
}
