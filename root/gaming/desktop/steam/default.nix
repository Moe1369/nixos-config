# Steam desktop client.
{ pkgs, ... }:
{
  programs.steam = {
    enable = true;
    extest.enable = true;
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
    extraPackages = with pkgs;[
      gamescope
      mangohud
    ];
  };
}
