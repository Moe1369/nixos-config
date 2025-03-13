# Install GPU drivers.
{ pkgs, ... }:
 {
   environment.systemPackages =
   (with pkgs; [
    amf
    nur.repos.materus.amdgpu-pro-libs.firmware
    nur.repos.materus.amdgpu-pro-libs.amf
    nur.repos.materus.amdgpu-pro-libs.opengl
    nur.repos.materus.amdgpu-pro-libs.prefixes
    nur.repos.materus.amdgpu-pro-libs.vulkan
    nur.repos.materus.ffmpeg_7-amf-full
    ]);
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
}
