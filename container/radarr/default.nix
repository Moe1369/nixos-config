{ ... }:
{
  virtualisation.oci-containers.containers."container-radarr-app" = {
    autoStart = true;
    image = "lscr.io/linuxserver/radarr:latest";
    environment = {
      "TZ" = "Europe/Berlin";
      "PUID" = "1000";
      "PGID" = "100";
    };
    networks = [
      "network-internal"
    ];
    volumes = [
      "volume-radarr-config:/config:rw"
      "/data:/data:rw"
    ];
    ports = ["7878:7878"];
  };
}
