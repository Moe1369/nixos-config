{ ... }:
{
  virtualisation.oci-containers.containers."emby-app" = {
    autoStart = true;
    image = "emby/embyserver";
    devices = [
        "/dev/dri:/dev/dri"
    ];
    environment = {
      "TZ" = "Europe/Berlin";
    };
    volumes = [
      "vl-emby-config:/config:rw"
      #"/daten/arr-suite:/daten/arr-suite:rw"
    ];
    ports = ["8096:8096"];
  };
}
