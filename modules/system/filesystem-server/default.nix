{ ... }:
{
  networking.hostId = "efc6dacc";
  boot.zfs.extraPools = [ "root" "data" ];

  fileSystems."/boot" =
    { device = "/dev/disk/by-partlabel/EFI";
      fsType = "vfat";
    };

  fileSystems."/" =
    { device = "zpool-fast/root";
      fsType = "zfs";
    };

  fileSystems."/data" =
    { device = "zpool-slow/data";
      fsType = "zfs";
    };

  swapDevices = [ ];
}
