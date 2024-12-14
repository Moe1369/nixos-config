{ pkgs, ... }:
{
  system.activationScripts.network-sonarr = ''
    ${pkgs.docker}/bin/docker network create network-sonarr
  '';
  virtualisation.oci-containers.containers."container-sonarr-app" = {
    autoStart = true;
    image = "lscr.io/linuxserver/sonarr:latest";
    environment = {
      "TZ" = "Europe/Berlin";
    };
    networks = [
      "network-sonarr"
    ];
    volumes = [
      "volume-sonarr-config:/config:rw"
      #"/daten/arr-suite:/daten/arr-suite:rw"
    ];
    ports = ["8989:8989"];
  };
}
