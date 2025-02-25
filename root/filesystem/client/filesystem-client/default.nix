# Filesystem for clients. Use partlabel as device to make it reusable. Singledisk setup.
{ ... }:
{
    fileSystems."/" =
    { device = "/dev/disk/by-partlabel/root";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-label/EFI";
      fsType = "vfat";
      options = [ "fmask=0022" "dmask=0022" ];
    };

  swapDevices = [ {
    device = "/var/lib/swapfile";
    size = 16*1024;
  }];
}
