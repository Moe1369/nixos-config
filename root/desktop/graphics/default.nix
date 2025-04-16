# Install GPU drivers and vulkan hdr layer
{ pkgs, ... }:
 {
  hardware.amdgpu.initrd.enable = true;
  boot.initrd.kernelModules = [ "amdgpu" ];
  boot.kernelModules = [ "amdgpu" ];
  environment.systemPackages = with pkgs;[
    vulkan-tools
  ];
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
}
