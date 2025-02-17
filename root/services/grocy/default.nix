{ ... }:
{
  virtualisation.oci-containers.containers."container-grocy-app" = {
    autoStart = true;
    image = "lscr.io/linuxserver/grocy:latest";
    environment = {
      "TZ" = "Europe/Berlin";
      "PUID" = "1000";
      "PGID" = "1000";
    };
    networks = [
      "network-internal"
    ];
    ports = [
      "9283:80"
    ];
    volumes = [
      "volume-grocy-config:/config:rw"
    ];
   #extraOptions = [
   #   "--pull=always"
   # ];
  };
}
