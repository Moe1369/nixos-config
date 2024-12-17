{ ... }:
{
  virtualisation.oci-containers.containers."container-radarr-app" = {
    autoStart = true;
    image = "lscr.io/linuxserver/radarr:latest";
    environment = {
      "TZ" = "Europe/Berlin";
      "PUID" = "0";
      "PGID" = "0";
    };
    networks = [
      "network-internal"
      "network-external"
    ];
    volumes = [
      "volume-radarr-config:/config:rw"
      "/data:/data:rw"
    ];
    ports = ["7878:7878"];
    labels = {
      "caddy" = "radarr.chrayed.de";
      "caddy.reverse_proxy_0" = "/outpost.goauthentik.io/* http://10.0.10.2:9000";
      "caddy.forward_auth" = "https://radarr.chrayed.de";
      "caddy.forward_auth.uri" = "/outpost.goauthentik.io/auth/caddy";
      "caddy.forward_auth.copy_headers" = "X-Authentik-Username X-Authentik-Groups X-Authentik-Email X-Authentik-Name X-Authentik-Uid X-Authentik-Jwt X-Authentik-Meta-Jwks X-Authentik-Meta-Outpost X-Authentik-Meta-Provider X-Authentik-Meta-App X-Authentik-Meta-Version";
      "caddy.forward_auth.trusted_proxies" = "10.0.0.0/8";
      "caddy.reverse_proxy_1" = "{{upstreams 7878}}";
  };
};
}
