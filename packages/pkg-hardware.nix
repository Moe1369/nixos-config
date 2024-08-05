{ pkgs, pkgs-stable, ... }:
{
  environment.systemPackages =
   (with pkgs; [
    pciutils
    aha
    lact
    kdePackages.isoimagewriter
    ])

    ++

   (with pkgs-stable; [

    ]);
}
