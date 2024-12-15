{ pkgs, ... }:
{
  system.activationScripts.network-recyclarr = ''
    ${pkgs.docker}/bin/docker network create network-recyclarr
  '';
  virtualisation.oci-containers.containers."container-recyclarr-app" = {
    autoStart = true;
    image = "ghcr.io/recyclarr/recyclarr:latest";
    environment = {
      "TZ" = "Europe/Berlin";
    };
    networks = [
      "network-recyclarr"
      "network-sonarr"
      "network-radarr"
    ];
    volumes = [
      #"volume-recyclarr-config:/config:rw"
      "./dotfiles/recyclarr.yml:/config/recyclarr.yml:rw"
    ];
  };
}
