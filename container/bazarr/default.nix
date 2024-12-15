{ pkgs, ... }:
{
  system.activationScripts.network-bazarr = ''
    ${pkgs.docker}/bin/docker network create network-bazarr
  '';
  virtualisation.oci-containers.containers."container-bazarr-app" = {
    autoStart = true;
    image = "lscr.io/linuxserver/bazarr:latest";
    environment = {
      "TZ" = "Europe/Berlin";
    };
    networks = [
      "network-bazarr"
    ];
    volumes = [
      "volume-bazarr-config:/config:rw"
      "/data:/data:rw"
    ];
    ports = ["6767:6767"];
  };
}
