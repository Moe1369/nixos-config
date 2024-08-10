# Bootsettings
{ ... }:
{
  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.initrd.verbose = false;
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.plymouth.enable = true;
  boot.plymouth.theme = "bgrt";
  boot.consoleLogLevel = 0;
  boot.kernelParams = [ "quiet" "udev.log_level=0" "amd_pstate=guided" ];
  boot.extraModprobeConfig = ''
    options amdgpu ppfeaturemask=0xFFF7FFFF
'';
}
