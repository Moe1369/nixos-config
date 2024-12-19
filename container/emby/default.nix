{ pkgs, ... }:
{
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver
      intel-compute-runtime
      vpl-gpu-rt
      vaapiVdpau
      libvdpau-va-gl
      intel-vaapi-driver
    ];
  };
  virtualisation.oci-containers.containers."container-emby-app" = {
    autoStart = true;
    image = "lscr.io/linuxserver/emby:latest";
    devices = [
        "/dev/dri:/dev/dri"
    ];
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
      "volume-emby-config:/config:rw"
      "/data:/data:rw"
    ];
    ports = ["8096:8096"];
    labels = {
      "caddy" = "emby.chrayed.de";
      "caddy.reverse_proxy" = "{{upstreams 8096}}";
    };
    extraOptions = [
      "--pull=always"
    ];
  };
}
