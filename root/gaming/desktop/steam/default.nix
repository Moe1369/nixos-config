# Steam desktop client.
{ pkgs, ... }:
{
  programs.steam = {
    enable = true;
    extest.enable = false;
    extraCompatPackages = with pkgs; [
      proton-ge-bin
      steamtinkerlaunch
    ];
    extraPackages = with pkgs;[
      gamescope
      mangohud
    ];
  };
}
