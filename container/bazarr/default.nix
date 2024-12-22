{ ... }:
{
  virtualisation.oci-containers.containers."container-bazarr-app" = {
    autoStart = true;
    image = "lscr.io/linuxserver/bazarr:latest";
    environment = {
      "TZ" = "Europe/Berlin";
      "PUID" = "0";
      "PGID" = "0";
    };
    networks = [
      "network-internal"
    ];
    volumes = [
      "volume-bazarr-config:/config:rw"
      "/data:/data:rw"
    ];
    ports = ["6767:6767"];
    extraOptions = [
      "--pull=always"
    ];
  };
  virtualisation.oci-containers.containers."container-bazarr-sync" = {
    autoStart = true;
    image = "ghcr.io/ajmandourah/bazarr-sync:latest";
    environment = {
      "TZ" = "Europe/Berlin";
      "PUID" = "0";
      "PGID" = "0";
    };
    networks = [
      "network-internal"
    ];
    volumes = [
      "volume-bazarr-sync:/usr/src/app:rw"
    ];
    extraOptions = [
      "--pull=always"
    ];
  };
}
