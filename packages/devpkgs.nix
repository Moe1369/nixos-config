{ config, pkgs, pkgs-stable, ... }:
{
  environment.systemPackages =
   (with pkgs; [
    git
    nixd
    ])

    ++

   (with pkgs-stable; [

    ]);
}
