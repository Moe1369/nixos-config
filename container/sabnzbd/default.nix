{ ... }:
{
  virtualisation.oci-containers.containers."container-sabnzbd-app" = {
    autoStart = true;
    image = "lscr.io/linuxserver/sabnzbd:latest";
    environment = {
      "TZ" = "Europe/Berlin";
      "PUID" = "1000";
      "PGID" = "100";
    };
    networks = [
      "network-internal"
    ];
    volumes = [
      "volume-sabnzbd-config:/config:rw"
      "/data:/data:rw"
    ];
    ports = ["8080:8080"];
  };
}
