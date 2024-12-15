{ pkgs, ... }:
{
  system.activationScripts.network-radarr = ''
    ${pkgs.docker}/bin/docker network create network-radarr
  '';
  virtualisation.oci-containers.containers."container-radarr-app" = {
    autoStart = true;
    image = "lscr.io/linuxserver/radarr:latest";
    environment = {
      "TZ" = "Europe/Berlin";
    };
    networks = [
      "network-radarr"
    ];
    volumes = [
      "volume-radarr-config:/config:rw"
      "/data:/data:rw"
    ];
    ports = ["7878:7878"];
  };
}
