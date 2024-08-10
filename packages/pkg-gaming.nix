# Gaming Packages excluding Steam
{ pkgs, pkgs-stable, ... }:
{
  environment.systemPackages =
   (with pkgs; [
    mangohud
    unigine-valley
    unigine-heaven
    unigine-tropics
    ])

    ++

   (with pkgs-stable; [

    ]);
}
