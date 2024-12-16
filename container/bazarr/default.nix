{ ... }:
{
  virtualisation.oci-containers.containers."container-bazarr-app" = {
    autoStart = true;
    image = "lscr.io/linuxserver/bazarr:latest";
    environment = {
      "TZ" = "Europe/Berlin";
      "PUID" = "1000";
      "PGID" = "100";
    };
    networks = [
      "network-internal"
    ];
    volumes = [
      "volume-bazarr-config:/config:rw"
      "/data:/data:rw"
    ];
    ports = ["6767:6767"];
  };
}
