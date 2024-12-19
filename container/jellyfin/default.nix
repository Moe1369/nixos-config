{ ... }:
{
  virtualisation.oci-containers.containers."container-jellyfin-app" = {
    autoStart = true;
    image = "jellyfin/jellyfin";
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
      "caddy" = "jellyfin-alt.chrayed.de";
      "caddy.reverse_proxy" = "{{upstreams 8096}}";
    };
    extraOptions = [
      "--pull=always"
    ];
  };
  virtualisation.oci-containers.containers."container-jellyfinvue-app" = {
    autoStart = true;
    image = "ghcr.io/jellyfin/jellyfin-vue:unstable";
    networks = [
      "network-internal"
      "network-external"
    ];
    environment = {
      "TZ" = "Europe/Berlin";
      "PUID" = "0";
      "PGID" = "0";
    };
    labels = {
      "caddy" = "jellyfin.chrayed.de";
      "caddy.reverse_proxy" = "{{upstreams 80}}";
    };
    extraOptions = [
      "--pull=always"
    ];
  };
}
