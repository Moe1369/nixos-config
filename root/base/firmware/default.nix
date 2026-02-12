# Firmware updater.
{ ... }:
{
  services.fwupd.enable = true;
  hardware.enableAllFirmware = true;
}
