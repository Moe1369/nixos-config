{ pkgs, ... }:
{
  system.activationScripts.network-traefik = ''
    ${pkgs.docker}/bin/docker network create network-traefik
  '';
  virtualisation.oci-containers.containers."container-traefik-app" = {
    autoStart = true;
    image = "traefik";
    environment = {
      "TZ" = "Europe/Berlin";
    };
    networks = [
      "network-traefik"
    ];
    volumes = [
      "/var/run/docker.sock:/var/run/docker.sock:ro"
    ];
    ports = ["80:80" "443:443"];
  };
}
