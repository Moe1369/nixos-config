# Steam desktop client.
{ pkgs, ... }:
{
  hardware.steam-hardware.enable = true;
  programs.steam = {
    enable = true;
    extest.enable = true;
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
    extraPackages = with pkgs;[
      gamescope
      mangohud
      vulkan-hdr-layer-kwin6
    ];
  };
}
