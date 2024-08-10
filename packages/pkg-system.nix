# System Packages like Partitionmanager
{ pkgs, pkgs-stable, ... }:
{
  environment.systemPackages =
   (with pkgs; [
    kdePackages.ksystemlog
    kdePackages.partitionmanager
    ])

    ++

   (with pkgs-stable; [

    ]);
}
