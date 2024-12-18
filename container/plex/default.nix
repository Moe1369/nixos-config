{ pkgs, ... }:
{
  virtualisation.oci-containers.containers."container-plex-app" = {
    autoStart = true;
    image = "lscr.io/linuxserver/plex:latest";
    devices = [
        "/dev/dri:/dev/dri"
    ];
    environment = {
      "TZ" = "Europe/Berlin";
      "PUID" = "0";
      "PGID" = "0";
    };
    networks = [
      "network-internal"
      "network-external"
    ];
    volumes = [
      "volume-plex-config:/config:rw"
      "/data:/data:rw"
    ];
    ports = ["32400:32400"];
    labels = {
      "caddy" = "plex.chrayed.de";
      "caddy.reverse_proxy" = "{{upstreams 32400}}";
    };
  };
}
