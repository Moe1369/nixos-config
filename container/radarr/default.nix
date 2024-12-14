{ pkgs, lib, ... }:

{
  virtualisation.docker = {
    enable = true;
    autoPrune.enable = true;
  };
  virtualisation.oci-containers.backend = "docker";

  virtualisation.oci-containers.containers."ct-radarr-app" = {
    autoStart = true;
    image = "lscr.io/linuxserver/radarr:latest";
    environment = {
      "TZ" = "Europe/Berlin";
    };
    volumes = [
      "/daten/arr-suite:/daten/arr-suite:rw"
      "vl-radarr-config:/config:rw"
    ];
    log-driver = "journald";
    extraOptions = [
      "--network-alias=ct-radarr-app"
      "--network=nw-external"
      "--network=nw-internal"
    ];
    ports = ["7878:7878"];
  };
}
