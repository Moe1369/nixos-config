# Install GPU drivers.
{ pkgs, ... }:
 {
   environment.systemPackages =
   (with pkgs; [
    amf
    ]);
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
}
