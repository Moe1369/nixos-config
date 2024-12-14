{ ... }:
{
  # Containers
  virtualisation.oci-containers.containers."ct-auth-cache" = {
    image = "docker.io/library/redis:alpine";
    volumes = [
      "vl-auth-cache:/data:rw"
    ];
    cmd = [ "--save" "60" "1" "--loglevel" "warning" ];
  };

  virtualisation.oci-containers.containers."ct-auth-db" = {
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
  virtualisation.oci-containers.containers."ct-auth-server" = {
    image = "ghcr.io/goauthentik/server";
    environment = {
      "AUTHENTIK_SECRET_KEY" = "oKD8DdROaAlePagcvZ7GJkpGDpjTVkQAHSuI/U+nyBoWRh+qOzagcbrxb0PQNVkoxp9gmYQB6Tn3uWM6";
      "AUTHENTIK_POSTGRESQL__HOST" = "ct-auth-db";
      "AUTHENTIK_POSTGRESQL__NAME" = "authentik";
      "AUTHENTIK_POSTGRESQL__PASSWORD" = "shmJQWMIWJRI23jn19842!";
      "AUTHENTIK_POSTGRESQL__USER" = "authentik";
      "AUTHENTIK_REDIS__HOST" = "ct-auth-cache";
    };
    volumes = [
      "vl-auth-media:/media:rw"
      "vl-auth-templates:/templates:rw"
    ];
    cmd = [ "server" ];
    dependsOn = [
      "ct-auth-cache"
      "ct-auth-db"
    ];
  };
  virtualisation.oci-containers.containers."ct-auth-worker" = {
    image = "ghcr.io/goauthentik/server";
    environment = {
      "AUTHENTIK_POSTGRESQL__HOST" = "ct-auth-db";
      "AUTHENTIK_POSTGRESQL__NAME" = "authentik";
      "AUTHENTIK_POSTGRESQL__PASSWORD" = "shmJQWMIWJRI23jn19842!";
      "AUTHENTIK_POSTGRESQL__USER" = "authentik";
      "AUTHENTIK_REDIS__HOST" = "ct-auth-cache";
    };
    volumes = [
      "/run/docker.sock:/var/run/docker.sock:rw"
      "vl-auth-certs:/certs:rw"
      "vl-auth-media:/media:rw"
      "vl-auth-templates:/templates:rw"
    ];
    cmd = [ "worker" ];
    dependsOn = [
      "ct-auth-cache"
      "ct-auth-db"
    ];
  };
}
