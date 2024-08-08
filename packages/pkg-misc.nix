{ pkgs, pkgs-stable, ... }:
{
  environment.systemPackages =
   (with pkgs; [
    google-chrome
    teams-for-linux
    citrix_workspace
    ])

    ++

   (with pkgs-stable; [

    ]);
}
