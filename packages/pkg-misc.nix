{ pkgs, pkgs-stable, ... }:
{
  environment.systemPackages =
   (with pkgs; [
    google-chrome
    teams-for-linux
    ])

    ++

   (with pkgs-stable; [

    ]);
}
