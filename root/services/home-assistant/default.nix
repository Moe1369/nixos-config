{ ... }:
{
  virtualisation.oci-containers.containers."container-home-assistant-app" = {
    autoStart = true;
    image = "ghcr.io/home-assistant/home-assistant:stable";
    environment = {
      "TZ" = "Europe/Berlin";
      "PUID" = "0";
      "PGID" = "0";
    };
    networks = [
      "host"
    ];
    volumes = [
      "volume-home-assistant-config:/config:rw"
    ];
    extraOptions = [
      "--pull=always"
    ];
  };
}
