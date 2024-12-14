{ ... }:
{
  virtualisation.oci-containers.containers."sonarr-app" = {
    autoStart = true;
    image = "lscr.io/linuxserver/sonarr:latest";
    environment = {
      "TZ" = "Europe/Berlin";
    };
    volumes = [
      "vl-sonarr-config:/config:rw"
      #"/daten/arr-suite:/daten/arr-suite:rw"
    ];
    ports = ["8989:8989"];
  };
}
