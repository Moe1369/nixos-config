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
  virtualisation.oci-containers.containers."container-reiverr-app" = {
    autoStart = true;
    image = "ghcr.io/aleksilassila/reiverr:latest";
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
    ];
    volumes = [
      "volume-reiverr-config:/config:rw"
      "/data:/data:ro"
    ];
    ports = ["9494:9494"];
    extraOptions = [
      "--pull=always"
    ];
  };
}
