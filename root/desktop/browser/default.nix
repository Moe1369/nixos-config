# Only install Chrome. Declaritive options not needed.
{ pkgs, ... }:
{
  environment.systemPackages =
   (with pkgs; [
    google-chrome
    ]);
}
