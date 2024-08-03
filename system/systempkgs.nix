{ config, pkgs, pkgs-stable, ... }:
{
  environment.systemPackages =
   (with pkgs; [
    home-manager
    ])

    ++

   (with pkgs-stable; [

    ]);
}
