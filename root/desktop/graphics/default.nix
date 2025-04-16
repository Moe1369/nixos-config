# Install GPU drivers and vulkan hdr layer
{ pkgs, ... }:
 {
  environment.systemPackages = with pkgs;[
    vulkan-hdr-layer-kwin6
    vulkan-tools
  ];
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
}
