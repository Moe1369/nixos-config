{ config, pkgs, pkgs-unstable, ... }:
{
  services.fwupd.enable = true;
  services.printing.enable = true;
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  services.libinput.enable = false;
  swapDevices = [ {
    device = "/var/lib/swapfile";
    size = 16*1024;
  } ];
}
