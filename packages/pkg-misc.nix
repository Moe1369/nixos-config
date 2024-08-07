{ pkgs, pkgs-stable, ... }:
{
  environment.systemPackages =
   (with pkgs; [
    google-chrome
    ])

    ++

   (with pkgs-stable; [
    teams-for-linux
    ]);
}
