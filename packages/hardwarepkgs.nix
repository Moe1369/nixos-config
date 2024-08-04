{ pkgs, pkgs-stable, ... }:
{
  environment.systemPackages =
   (with pkgs; [
    pciutils
    aha
    ])

    ++

   (with pkgs-stable; [

    ]);
}
