{ pkgs, ... }:
{
  environment.systemPackages =
   (with pkgs; [
    kde-rounded-corners
    neofetch
    ibm-plex
    ]);
}
