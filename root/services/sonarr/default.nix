{ ... }:
{
  virtualisation.oci-containers.containers."container-sonarr-app" = {
    autoStart = true;
    image = "lscr.io/linuxserver/sonarr:latest";
    environment = {
      "TZ" = "Europe/Berlin";
      "PUID" = "0";
      "PGID" = "0";
    };
    networks = [
      "network-internal"
    ];
    volumes = [
      "volume-sonarr-config:/config:rw"
      "/data:/data:rw"
    ];
    ports = ["8989:8989"];
    extraOptions = [
      "--pull=always"
    ];
  };
}
