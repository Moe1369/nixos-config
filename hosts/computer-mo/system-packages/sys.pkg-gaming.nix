{ pkgs, ... }:
{
  environment.systemPackages =
   (with pkgs; [
    mangohud
    unigine-valley
    unigine-heaven
    unigine-tropics
    ]);
}
