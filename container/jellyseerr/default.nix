{ ... }:
{
  virtualisation.oci-containers.containers."jellyseerr-app" = {
    autoStart = true;
    image = "fallenbagel/jellyseerr";
    environment = {
      "TZ" = "Europe/Berlin";
      "JELLYFIN_TYPE" = "emby";
    };
    volumes = [
      "vl-jellyseerr-config:/app/config:rw"
    ];
    ports = ["5055:5055"];
  };
}
