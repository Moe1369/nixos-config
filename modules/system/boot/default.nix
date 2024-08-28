{ pkgs, ... }:
{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.plymouth.enable = true;
  boot.plymouth.theme = "bgrt";
  boot.consoleLogLevel = 0;
  boot.kernelParams = [ "quiet" "udev.log_level=0" ];
  boot.initrd.verbose = false;
 # boot.lanzaboote = {
 #   enable = true;
 #   pkiBundle = "/etc/secureboot";
 # };
  environment.systemPackages = [
    pkgs.sbctl
  ];
}
