{ pkgs, ... }:
{
  system.activationScripts.network-emby = ''
    ${pkgs.docker}/bin/docker network create network-emby
  '';
  virtualisation.oci-containers.containers."container-emby-app" = {
    autoStart = true;
    image = "emby/embyserver";
    devices = [
        "/dev/dri:/dev/dri"
    ];
    environment = {
      "TZ" = "Europe/Berlin";
    };
    networks = [
      "network-emby"
      "network-traefik"
    ];
    volumes = [
      "volume-emby-config:/config:rw"
      "/data:/data:rw"
    ];
    ports = ["8096:8096"];
    labels = {
      "traefik.enable" = "true";
      "traefik.http.routers.dozzle.entrypoints" = "web";
      "traefik.http.routers.dozzle.rule" = "Host(`emby.chrayed.de`)";
      "traefik.http.services.dozzle.loadBalancer.port" = "8096";
    };
  };
}
