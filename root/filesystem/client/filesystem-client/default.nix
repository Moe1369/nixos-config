# Filesystem for clients. Use partlabel as device to make it reusable. Singledisk setup.
{ ... }:
{
    fileSystems."/" =
    { device = "/dev/disk/by-label/ROOT";
      fsType = "xfs";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-label/BOOT";
      fsType = "vfat";
      options = [ "fmask=0022" "dmask=0022" ];
    };

  swapDevices = [ {
    device = "/var/lib/swapfile";
    size = 16*1024;
  }];
}
