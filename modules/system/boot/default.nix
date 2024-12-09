{ pkgs, ... }:
{
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.consoleMode = "max";
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.timeout = 0;
  boot.consoleLogLevel = 0;
  boot.kernelParams = [ "quiet" "splash" "boot.shell_on_fail" "i915.fastboot=1" "loglevel=3" "rd.systemd.show_status=false" "rd.udev.log_level=3" "udev.log_priority=3" ];
  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" ];
  boot.initrd.verbose = false;
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];
    boot.plymouth = {
      enable = true;
      theme = "connect";
      themePackages = with pkgs; [
        # By default we would install all themes
        (adi1090x-plymouth-themes.override {
          selected_themes = [ "connect" ];
        })
      ];
    };
}
