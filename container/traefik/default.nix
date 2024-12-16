{ pkgs, ... }:
{
  system.activationScripts.network-traefik = ''
    ${pkgs.docker}/bin/docker network create network-traefik
  '';
  virtualisation.oci-containers.containers."container-traefik-app" = {
    autoStart = true;
    cmd = [
      "--api.insecure=true"
      "--providers.docker"
    ];
    image = "traefik";
    environment = {
      "TZ" = "Europe/Berlin";
      "PORKBUN_SECRET_API_KEY" = "sk1_f5d9b0238d65dc7bae261bc2426d198107387ab5bbbbdce366d346f6776304d0";
      "PORKBUN_API_KEY" = "pk1_fd24e6bcbff857b26dc334a0bfba8bd3d75cac0290f8bb9366ee46c30c68b23d";
    };
    networks = [
      "network-traefik"
    ];
    volumes = [
      "/var/run/docker.sock:/var/run/docker.sock:ro"
      "volume-traefik-tls:/tls:rw"
      "./dotfiles/traefik.yaml:/traefik.yaml:ro"
    ];
    ports = ["80:80" "443:443" "8080:8080"];
  };
}
