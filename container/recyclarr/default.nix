{ ... }:
{
  virtualisation.oci-containers.containers."container-recyclarr-app" = {
    autoStart = true;
    image = "ghcr.io/recyclarr/recyclarr:latest";
    environment = {
      "TZ" = "Europe/Berlin";
      "PUID" = "0";
      "PGID" = "0";
    };
    networks = [
      "network-internal"
    ];
    volumes = [
      "volume-recyclarr-config:/config:rw"
    ];
    extraOptions = [
      "--pull=always"
    ];
  };
}
