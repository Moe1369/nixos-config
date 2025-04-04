# Install GPU drivers and vulkan hdr layer
{ pkgs, ... }:
 {
  environment.systemPackages = [
    pkgs.vulkan-hdr-layer-kwin6
  ];
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
}
