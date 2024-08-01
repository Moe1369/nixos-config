{ config, pkgs, pkgs-stable, ... }:
{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.plymouth.enable = true;
  boot.plymouth.theme = "bgrt";
  boot.initrd.verbose = false;
  boot.consoleLogLevel = 0;
  boot.kernelParams = [ "quiet" "udev.log_level=0" "radeon.cik_support=0" "amdgpu.cik_support=1" ];
  boot.extraModprobeConfig = ''
    options amdgpu ppfeaturemask=0xFFF7FFFF
'';
}
