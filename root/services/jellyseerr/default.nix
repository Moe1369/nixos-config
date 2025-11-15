{ ... }:
{
  virtualisation.oci-containers.containers."container-jellyseerr-app" = {
    autoStart = true;
    image = "fallenbagel/jellyseerr";
    environment = {
      "TZ" = "Europe/Berlin";
      "JELLYFIN_TYPE" = "emby";
    };
    networks = [
      "network-internal"
    ];
    volumes = [
      "volume-jellyseerr-config:/app/config:rw"
    ];
    ports = ["5055:5055"];
    extraOptions = [
      "--pull=always"
    ];
  };
}
