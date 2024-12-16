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
      "network-caddy"
    ];
    volumes = [
      "volume-emby-config:/config:rw"
      "/data:/data:rw"
    ];
    ports = ["8096:8096"];
    labels = {
      "caddy" = "emby.chrayed.de";
      "caddy.reverse_proxy" = "{{upstreams 8096}}";
    };
  };
}
