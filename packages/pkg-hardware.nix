{ pkgs, pkgs-stable, ... }:
{
  environment.systemPackages =
   (with pkgs; [
    pciutils
    aha
    lact
    kdePackages.isoimagewriter
    kdePackages.kamoso
    ])

    ++

   (with pkgs-stable; [

    ]);
}
