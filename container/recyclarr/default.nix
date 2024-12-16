{ ... }:
{
  virtualisation.oci-containers.containers."container-recyclarr-app" = {
    autoStart = true;
    image = "ghcr.io/recyclarr/recyclarr:latest";
    environment = {
      "TZ" = "Europe/Berlin";
    };
    networks = [
      "network-internal"
    ];
    volumes = [
      "volume-recyclarr-config:/config:rw"
    ];
  };
}
