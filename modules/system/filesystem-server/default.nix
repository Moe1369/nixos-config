{ ... }:
{
  boot.zfs.extraPools = [ "root" "nix" "var" "daten" ];

  fileSystems."/boot" =
    { device = "/dev/disk/by-partlabel/EFI";
      fsType = "vfat";
    };

  fileSystems."/" =
    { device = "zpool/root";
      fsType = "zfs";
    };

  fileSystems."/nix" =
    { device = "zpool/nix";
      fsType = "zfs";
    };

  fileSystems."/data" =
    { device = "zpool/data";
      fsType = "zfs";
    };

  swapDevices = [ {
    device = "/var/lib/swapfile";
    size = 8*1024;
  }];
}
