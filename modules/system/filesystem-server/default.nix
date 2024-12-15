{ ... }:
{
  networking.hostId = "efc6dacc";
  boot.zfs.extraPools = [ "root" "nix" "var" "data" "home"];

  fileSystems."/boot" =
    { device = "/dev/disk/by-partlabel/EFI";
      fsType = "vfat";
    };

  fileSystems."/" =
    { device = "zpool-fast/root";
      fsType = "zfs";
    };

  fileSystems."/home" =
    { device = "zpool-fast/home";
      fsType = "zfs";
    };

  fileSystems."/nix" =
    { device = "zpool-fast/nix";
      fsType = "zfs";
    };


  fileSystems."/var" =
    { device = "zpool-fast/var";
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
