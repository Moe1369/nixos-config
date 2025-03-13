# Install GPU drivers.
{ pkgs, ... }:
 {
   environment.systemPackages =
   (with pkgs; [
    ffmpeg-full
    amf
    nur.repos.materus.amdgpu-pro-libs.firmware
    nur.repos.materus.amdgpu-pro-libs.amf
    ]);
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
}
