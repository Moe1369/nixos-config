{ ... }:
{
  networking.hostId = "efc6dacc";
  boot.zfs.devNodes = "/dev/disk/by-id";
  boot.zfs.extraPools = [ "ssd" "hdd" ];

    fileSystems."/" =
    { device = "/dev/disk/by-partlabel/root";
      fsType = "ext4";
    };

  fileSystems."/var/lib/docker" =
    { device = "ssd/docker";
      fsType = "zfs";
      options = [ "zfsutil" ];
    };

  fileSystems."/data" =
    { device = "hdd/data";
      fsType = "zfs";
      options = [ "zfsutil" ];
    };

  swapDevices = [ {
    device = "/var/lib/swapfile";
    size = 16*1024;
  }];
}
