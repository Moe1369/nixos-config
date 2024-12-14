{ ... }:
{
  # Containers
  virtualisation.oci-containers.containers."authentik-cache" = {

    image = "docker.io/library/redis:alpine";
    volumes = [
      "vl-auth-cache:/data:rw"
    ];
    cmd = [ "--save" "60" "1" "--loglevel" "warning" ];
  };

  virtualisation.oci-containers.containers."authentik-db" = {
    image = "docker.io/library/postgres:12-alpine";
    environment = {
      "POSTGRES_DB" = "authentik";
      "POSTGRES_PASSWORD" = "shmJQWMIWJRI23jn19842!";
      "POSTGRES_USER" = "authentik";
    };
    volumes = [
      "vl-auth-db:/var/lib/postgresql/data:rw"
    ];
  };
  virtualisation.oci-containers.containers."authentik-server" = {
    image = "ghcr.io/goauthentik/server";
    environment = {
      "AUTHENTIK_SECRET_KEY" = "OS7C4vThZKf5tPGKlOu3QXgZIHWAF7HBfpk/Y6LMVh7QMdyOD6NwojmASlKb3lwtYA5OdZzDLB2GNSQg";
      "AUTHENTIK_POSTGRESQL__HOST" = "authentik-db";
      "AUTHENTIK_POSTGRESQL__NAME" = "authentik";
      "AUTHENTIK_POSTGRESQL__PASSWORD" = "shmJQWMIWJRI23jn19842!";
      "AUTHENTIK_POSTGRESQL__USER" = "authentik";
      "AUTHENTIK_REDIS__HOST" = "authentik-cache";
    };
    volumes = [
      "vl-auth-media:/media:rw"
      "vl-auth-templates:/templates:rw"
    ];
    cmd = [ "server" ];
    dependsOn = [
      "authentik-cache"
      "authentik-db"
    ];
  };
  virtualisation.oci-containers.containers."authentik-worker" = {
    image = "ghcr.io/goauthentik/server";
    environment = {
      "AUTHENTIK_SECRET_KEY" = "OS7C4vThZKf5tPGKlOu3QXgZIHWAF7HBfpk/Y6LMVh7QMdyOD6NwojmASlKb3lwtYA5OdZzDLB2GNSQg";
      "AUTHENTIK_POSTGRESQL__HOST" = "authentik-db";
      "AUTHENTIK_POSTGRESQL__NAME" = "authentik";
      "AUTHENTIK_POSTGRESQL__PASSWORD" = "shmJQWMIWJRI23jn19842!";
      "AUTHENTIK_POSTGRESQL__USER" = "authentik";
      "AUTHENTIK_REDIS__HOST" = "authentik-cache";
    };
    volumes = [
      "/run/docker.sock:/var/run/docker.sock:rw"
      "vl-auth-certs:/certs:rw"
      "vl-auth-media:/media:rw"
      "vl-auth-templates:/templates:rw"
    ];
    cmd = [ "worker" ];
    dependsOn = [
      "authentik-cache"
      "authentik-db"
    ];
  };
}
