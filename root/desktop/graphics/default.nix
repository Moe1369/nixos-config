# Install GPU drivers and vulkan hdr layer
{ pkgs, ... }:
 {
  hardware.amdgpu.initrd.enable = true;
  boot.initrd.kernelModules = [ "amdgpu" ];
  boot.kernelModules = [ "amdgpu" ];
  environment.systemPackages = with pkgs;[
    vulkan-tools
    vulkan-hdr-layer-kwin6
  ];
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
}
