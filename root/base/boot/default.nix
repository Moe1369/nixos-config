# Boot options.
{ ... }:
{
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.consoleMode = "max";
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.timeout = 1;
  boot.consoleLogLevel = 0;
  # Lots of kernel params for pure quiet boot.
  boot.kernelParams = [ "quiet" "splash" "boot.shell_on_fail" "i915.fastboot=1" "loglevel=3" "rd.systemd.show_status=false" "rd.udev.log_level=3" "udev.log_priority=3" "i915.enable_guc=2" ];
  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" ];
  boot.initrd.verbose = false;
  boot.initrd.enable = true;
  boot.plymouth.enable = true;
  boot.plymouth.theme = "bgrt";
}
