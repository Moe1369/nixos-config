{ ... }:
{
  virtualisation.oci-containers.containers."container-reiverr-app" = {
    autoStart = true;
    image = "ghcr.io/aleksilassila/reiverr:latest";
    networks = [
      "network-internal"
      "network-external"
    ];
    volumes = [
      "volume-reiverr-config:/app/config:rw"
    ];
    ports = ["9494:9494"];
    labels = {
      "caddy" = "reiverr.chrayed.de";
      "caddy.reverse_proxy" = "{{upstreams 9494}}";
    };
  };
}
