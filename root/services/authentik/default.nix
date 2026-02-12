{ ... }:
{
  virtualisation.oci-containers.containers."container-authentik-cache" = {
    image = "docker.io/library/redis:alpine";
    networks = [
      "network-internal"
    ];
    volumes = [
      "volume-authentik-cache:/data:rw"
    ];
    cmd = [ "--save" "60" "1" "--loglevel" "warning" ];
    extraOptions = [
      "--pull=always"
    ];
  };

  virtualisation.oci-containers.containers."container-authentik-db" = {
    image = "docker.io/library/postgres:12-alpine";
    environment = {
      "POSTGRES_DB" = "authentik";
      "POSTGRES_PASSWORD" = "shmJQWMIWJRI23jn19842!";
      "POSTGRES_USER" = "authentik";
    };
    networks = [
      "network-internal"
    ];
    volumes = [
      "volume-authentik-db:/var/lib/postgresql/data:rw"
    ];
    extraOptions = [
     "--pull=always"
    ];
  };
  virtualisation.oci-containers.containers."container-authentik-ldap" = {
    image = "ghcr.io/goauthentik/ldap";
    environment = {
      "AUTHENTIK_HOST" = "http://container-authentik-server:9000";
      "AUTHENTIK_INSECURE" = "true";
      "AUTHENTIK_TOKEN" = "yZPlmWkdLsteKXXAJJPFO0Txd7o9zZlIfFdyBlGh0LjPjatYjpcqSYHwzMQ9";
    };
    networks = [
      "network-internal"
    ];
    ports = [
      "389:3389"
      "636:6636"
    ];
    dependsOn = [
      "container-authentik-server"
      "container-authentik-worker"
      "container-authentik-cache"
      "container-authentik-db"
    ];
    extraOptions = [
      "--pull=always"
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
      "AUTHENTIK_LISTEN__TRUSTED_PROXY_CIDRS" = "172.16.0.0/12";
    };
    networks = [
      "network-internal"
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
    extraOptions = [
      "--pull=always"
    ];
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
      "AUTHENTIK_LISTEN__TRUSTED_PROXY_CIDRS" = "172.16.0.0/12";
    };
    networks = [
      "network-internal"
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
    extraOptions = [
      "--pull=always"
    ];
  };
}
