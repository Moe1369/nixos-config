# Steam desktop client.
{ pkgs, ... }:
{
  programs.steam = {
    enable = true;
    extest.enable = true;
    package = pkgs.steam.override {
      extraPkgs = pkgs: with pkgs; [
        libkrb5
        keyutils
      ];
    };
  };
  programs.gamescope.enable = true;
  environment.systemPackages =
   (with pkgs; [
    mangohud
     ]);
}
