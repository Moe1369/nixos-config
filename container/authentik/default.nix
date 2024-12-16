{ pkgs, ... }:
{
  system.activationScripts.network-authentik = ''
    ${pkgs.docker}/bin/docker network create network-authentik
  '';
  # Containers
  virtualisation.oci-containers.containers."container-authentik-cache" = {
    image = "docker.io/library/redis:alpine";
    networks = [
      "network-authentik"
    ];
    volumes = [
      "volume-authentik-cache:/data:rw"
    ];
    cmd = [ "--save" "60" "1" "--loglevel" "warning" ];
  };

  virtualisation.oci-containers.containers."container-authentik-db" = {
    image = "docker.io/library/postgres:12-alpine";
    environment = {
      "POSTGRES_DB" = "authentik";
      "POSTGRES_PASSWORD" = "shmJQWMIWJRI23jn19842!";
      "POSTGRES_USER" = "authentik";
    };
    networks = [
      "network-authentik"
    ];
    volumes = [
      "volume-authentik-db:/var/lib/postgresql/data:rw"
    ];
  };
  virtualisation.oci-containers.containers."container-authentik-server" = {
    image = "ghcr.io/goauthentik/server";
    environment = {
      "AUTHENTIK_SECRET_KEY" = "OS7C4vThZKf5tPGKlOu3QXgZIHWAF7HBfpk/Y6LMVh7QMdyOD6NwojmASlKb3lwtYA5OdZzDLB2GNSQg";
      "AUTHENTIK_POSTGRESQL__HOST" = "container-authentik-db";
      "AUTHENTIK_POSTGRESQL__NAME" = "authentik";
      "AUTHENTIK_POSTGRESQL__PASSWORD" = "shmJQWMIWJRI23jn19842!";
      "AUTHENTIK_POSTGRESQL__USER" = "authentik";
      "AUTHENTIK_REDIS__HOST" = "container-authentik-cache";
    };
    networks = [
      "network-authentik"
      "network-caddy"
    ];
    ports = [
    "9000:9000"
    "9443:9443"
    ];
    volumes = [
      "volume-authentik-media:/media:rw"
      "volume-authentik-templates:/templates:rw"
    ];
    cmd = [ "server" ];
    dependsOn = [
      "container-authentik-cache"
      "container-authentik-db"
    ];
    labels = {
      "caddy" = "emby.chrayed.de";
      "caddy.reverse_proxy" = "{{upstreams 8096}}";
    };
  };
  virtualisation.oci-containers.containers."container-authentik-worker" = {
    image = "ghcr.io/goauthentik/server";
    environment = {
      "AUTHENTIK_SECRET_KEY" = "OS7C4vThZKf5tPGKlOu3QXgZIHWAF7HBfpk/Y6LMVh7QMdyOD6NwojmASlKb3lwtYA5OdZzDLB2GNSQg";
      "AUTHENTIK_POSTGRESQL__HOST" = "container-authentik-db";
      "AUTHENTIK_POSTGRESQL__NAME" = "authentik";
      "AUTHENTIK_POSTGRESQL__PASSWORD" = "shmJQWMIWJRI23jn19842!";
      "AUTHENTIK_POSTGRESQL__USER" = "authentik";
      "AUTHENTIK_REDIS__HOST" = "container-authentik-cache";
    };
    networks = [
      "network-authentik"
    ];
    volumes = [
      "/run/docker.sock:/var/run/docker.sock:rw"
      "volume-authentik-certs:/certs:rw"
      "volume-authentik-media:/media:rw"
      "volume-authentik-templates:/templates:rw"
    ];
    cmd = [ "worker" ];
    dependsOn = [
      "container-authentik-cache"
      "container-authentik-db"
    ];
  };
}
