# Filesystem for clients. Use partlabel as device to make it reusable. Singledisk setup.
{ ... }:
{
    fileSystems."/" =
    { device = "/dev/disk/by-partlabel/root";
      fsType = "xfs";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-partlabel/EFI";
      fsType = "vfat";
      options = [ "fmask=0077" "dmask=0077" ];
    };

  swapDevices = [ {
    device = "/var/lib/swapfile";
    size = 16*1024;
  }];
}
