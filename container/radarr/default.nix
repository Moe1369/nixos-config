{ ... }:
{
  virtualisation.oci-containers.containers."radarr-app" = {
    autoStart = true;
    image = "lscr.io/linuxserver/radarr:latest";
    environment = {
      "TZ" = "Europe/Berlin";
    };
    volumes = [
      "vl-radarr-config:/config:rw"
      #"/daten/arr-suite:/daten/arr-suite:rw"
    ];
    ports = ["7878:7878"];
  };
}
