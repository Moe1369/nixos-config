{ pkgs, ... }:
{
  environment.systemPackages =
   (with pkgs; [
    kde-rounded-corners
    ibm-plex
    ]);
}
