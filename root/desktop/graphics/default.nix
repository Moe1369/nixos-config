# Install GPU drivers.
{ pkgs, ... }:
 {
 #  environment.systemPackages =
 #  (with pkgs; [
 #   ffmpeg-full
 #   amf
 #   ]);
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
}
