{ ... }:
{
  virtualisation.oci-containers.containers."container-caddy-app" = {
    autoStart = true;
    image = "lucaslorentz/caddy-docker-proxy:ci-alpine";
    environment = {
      "CADDY_INGRESS_NETWORKS" = "network-external";
    };
    networks = [
      "network-external"
    ];
    volumes = [
      "/var/run/docker.sock:/var/run/docker.sock"
      "volume-caddy-config:/data:rw"
    ];
    ports = ["80:80" "443:443"];
    #extraOptions = [
    #  "--pull=always"
    #];
  };
}
