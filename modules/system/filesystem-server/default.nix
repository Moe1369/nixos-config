{ ... }:
{
  boot.zfs.extraPools = [ "root" "boot" "nix" "var" "daten" ];

  fileSystems."/" =
    { device = "zpool/root";
      fsType = "zfs";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-partlabel/EFI";
      fsType = "vfat";
    };

  fileSystems."/nix" =
    { device = "zpool/nix";
      fsType = "zfs";
    };

  fileSystems."/var" =
    { device = "zpool/var";
      fsType = "zfs";
    };

  fileSystems."/daten" =
    { device = "zpool/daten";
      fsType = "zfs";
    };

  swapDevices = [ {
    device = "/var/lib/swapfile";
    size = 8*1024;
  }];
}
