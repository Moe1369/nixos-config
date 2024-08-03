{ config, pkgs, pkgs-stable, ... }:
{
  environment.systemPackages =
   (with pkgs; [
    git
    nil
    ])

    ++

   (with pkgs-stable; [

    ]);
}
