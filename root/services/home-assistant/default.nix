{ ... }:
{
  virtualisation.oci-containers.containers."container-home-assistant-app" = {
    autoStart = true;
    image = "ghcr.io/home-assistant/home-assistant:stable";
    devices = [
        "/dev/ttyUSB0:/dev/ttyUSB0"
    ];
    environment = {
      "TZ" = "Europe/Berlin";
      "PUID" = "0";
      "PGID" = "0";
    };
    networks = [
      "network-internal"
    ];
    ports = [
      "8123:8123"
    ];
    volumes = [
      "volume-home-assistant-config:/config:rw"
      "/var/run/docker.sock:/var/run/docker.sock:ro"
    ];
   #extraOptions = [
   #   "--pull=always"
   # ];
  };
}
