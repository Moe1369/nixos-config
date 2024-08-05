{ pkgs, pkgs-stable, ... }:
{
  environment.systemPackages =
   (with pkgs; [
    pciutils
    aha
    lact
    ])

    ++

   (with pkgs-stable; [

    ]);
}
