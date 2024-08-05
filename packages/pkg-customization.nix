{ pkgs, pkgs-stable, ... }:
{
  environment.systemPackages =
   (with pkgs; [
    kde-rounded-corners
    neofetch
    ibm-plex
    ])

    ++

   (with pkgs-stable; [

    ]);
}
