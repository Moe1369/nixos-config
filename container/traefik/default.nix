{ pkgs, ... }:
{
  system.activationScripts.network-traefik = ''
    ${pkgs.docker}/bin/docker network create network-traefik
  '';
  virtualisation.oci-containers.containers."container-traefik-app" = {
    autoStart = true;
    cmd = [
      "--global.checkNewVersion=false"
      "--global.sendAnonymousUsage=true"
      "--entrypoints.web.address=:80"
      "--entrypoints.websecure.address=:443"
      "--entrypoints.traefik.address=:8080"
      "--entrypoints.websecure.http.tls=true"
      "--entrypoints.web.http.redirections.entrypoint.to=websecure"
      "--entrypoints.web.http.redirections.entrypoint.scheme=https"
      "--entrypoints.web.http.redirections.entrypoint.permanent=true"
      "--api=true"
      "--api.dashboard=true"
      "--api.insecure=true"
      "--entrypoints.websecure.forwardedHeaders.trustedIPs=10.0.0.0/8"
      "--log=true"
      "--log.filePath=/logs/traefik.log"
      "--log.level=ERROR"
      "--accessLog=true"
      "--accessLog.filePath=/logs/access.log"
      "--accessLog.bufferingSize=100"
      "--accessLog.filters.statusCodes=204-299,400-499,500-599"
      "--providers.docker=true"
      "--providers.docker.endpoint=unix:///var/run/docker.sock"
      "--providers.docker.exposedByDefault=false"
      "--providers.docker.network=network-traefik"
      "--entrypoints.websecure.http.tls.options=tls-opts@file"
      "--entrypoints.websecure.http.tls.certresolver=dns-porkbun"
      "--entrypoints.websecure.http.tls.domains.main=chrayed.de"
      "--providers.file.directory=/rules"
      "--providers.file.watch=true"
      "--certificatesResolvers.dns-porkbun.acme.caServer=https://acme-staging-v02.api.letsencrypt.org/directory"
      "--certificatesResolvers.dns-porkbun.acme.storage=/acme.json"
      "--certificatesResolvers.dns-porkbun.acme.dnsChallenge.provider=porkbun"
      "--certificatesResolvers.dns-porkbun.acme.dnsChallenge.resolvers=1.1.1.1:53,1.0.0.1:53"
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
    ];
    ports = ["80:80" "443:443" "8080:8080"];
  };
}
