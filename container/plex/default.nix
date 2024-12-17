{ ... }:
{
  virtualisation.oci-containers.containers."container-plex-app" = {
    autoStart = true;
    image = "lscr.io/linuxserver/plex:latest";
    environment = {
      "TZ" = "Europe/Berlin";
      "VERSION" = "docker";
      "PUID" = "0";
      "PGID" = "0";
    };
    networks = [
      "network-internal"
    ];
    volumes = [
      "volume-plex-config:/config:rw"
      "/data:/data:rw"
    ];
    ports = ["8081:80"];
  };
}
