{ ... }:
{
  virtualisation.oci-containers.containers."container-jellyfin-app" = {
    autoStart = true;
    image = "lscr.io/linuxserver/jellyfin:latest";
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
      "volume-jellyfin-config:/config:rw"
      "/data:/data:rw"
    ];
    ports = ["8097:8096"];
    labels = {
      "caddy" = "jellyfin.chrayed.de";
      "caddy.reverse_proxy" = "{{upstreams 8096}}";
    };
  };
}
