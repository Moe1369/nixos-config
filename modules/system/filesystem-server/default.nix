{ ... }:
{
  networking.hostId = "efc6dacc";
  boot.zfs.devNodes = "/dev/disk/by-id";
  boot.zfs.extraPools = [ "root" "var" "nix" "home" "data" ];

  fileSystems."/boot" =
    { device = "/dev/disk/by-id/nvme-CT1000P3SSD8_2304E6A27E90-part1";
      fsType = "vfat";
    };

  fileSystems."/" =
    { device = "zpool-fast/root";
      fsType = "zfs";
      options = [ "zfsutil" ];
    };

  fileSystems."/nix" =
    { device = "zpool-fast/nix";
      fsType = "zfs";
      options = [ "zfsutil" ];
    };

  fileSystems."/var" =
    { device = "zpool-fast/var";
      fsType = "zfs";
      options = [ "zfsutil" ];
    };

  fileSystems."/home" =
    { device = "zpool-fast/home";
      fsType = "zfs";
      options = [ "zfsutil" ];
    };

  fileSystems."/data" =
    { device = "zpool-slow/data";
      fsType = "zfs";
      options = [ "zfsutil" ];
    };

  swapDevices = [{
    device = "/dev/disk/by-id/nvme-CT1000P3SSD8_2304E6A27E90-part2";
    randomEncryption = true;
  }];
}
