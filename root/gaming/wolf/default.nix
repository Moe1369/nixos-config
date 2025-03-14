{ ... }:
{
  virtualisation.docker = {
    enable = true;
    autoPrune.enable = false;
  };
  virtualisation.oci-containers.backend = "docker";
  virtualisation.oci-containers.containers."container-wolf-app" = {
    autoStart = true;
    image = "wolf:latest";
    devices = [
        "/dev/dri:/dev/dri"
        "/dev/uinput:/dev/uinput"
        "/dev/uhid:/dev/uhid"
    ];
    environment = {
      "XDG_RUNTIME_DIR" = "/tmp/sockets";
      "HOST_APPS_STATE_FOLDER" = "/etc/wolf";
      "PGID" = "0";
    };
    networks = [
      "host"
    ];
    volumes = [
      "/opt/wolf/libs/libamdenc64.so.1.0:/usr/lib/libamdenc64.so:ro"
      "/opt/wolf/libs/libamfrt64.so.1.4.35:/usr/lib/libamfrt64.so.1:ro"
      "/etc/wolf:/etc/wolf:rw"
      "/var/run/docker.sock:/var/run/docker.sock:rw"
      "/tmp/sockets:/tmp/sockets:rw"
      "/dev/:/dev/:rw"
      "/run/udev:/run/udev:rw"
    ];
    extraOptions = [
      "--pull=always"
      "--device-cgroup-rule=c 13:* rmw"
    ];
  };
}
