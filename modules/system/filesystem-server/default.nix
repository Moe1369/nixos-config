{ ... }:
{
  boot.zfs.extraPools = [ "root" "nix" "var" "daten" ];

  fileSystems."/boot" =
    { device = "/dev/disk/by-partlabel/EFI";
      fsType = "vfat";
    };

  fileSystems."/" =
    { device = "zpool-fast/root";
      fsType = "zfs";
    };

  fileSystems."/nix" =
    { device = "zpool-fast/nix";
      fsType = "zfs";
    };

  fileSystems."/docker" =
    { device = "zpool-fast/docker";
      fsType = "zfs";
    };

  fileSystems."/data" =
    { device = "zpool-slow/data";
      fsType = "zfs";
    };

  swapDevices = [ {
    device = "/var/lib/swapfile";
    size = 8*1024;
  }];
}
