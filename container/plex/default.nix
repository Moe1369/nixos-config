{ pkgs, ... }:
{
  virtualisation.oci-containers.containers."container-plex-app" = {
    autoStart = true;
    image = "plexinc/pms-docker:latest";
    devices = [
        "/dev/dri:/dev/dri"
    ];
    environment = {
      "TZ" = "Europe/Berlin";
      "PUID" = "0";
      "PGID" = "0";
      "PLEX_CLAIM" = "claim-hjA_CBE2k65wzsf97-wm";
    };
    networks = [
      "network-internal"
      "network-external"
    ];
    volumes = [
      "volume-plex-config:/config:rw"
      "/data:/data:rw"
    ];
    ports = [
    "32400:32400"
    "8324:8324"
    "32469:32469"
    "1900:1900"
    "32410:32410"
    "32412:32412"
    "32413:32413"
    "32414:32414"
    ];
    labels = {
      "caddy" = "plex.chrayed.de";
      "caddy.reverse_proxy" = "{{upstreams 32400}}";
    };
  };
}
