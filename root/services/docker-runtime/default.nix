{ ... }:
{
  virtualisation.docker = {
    enable = true;
    autoPrune.enable = false;
  };
  virtualisation.oci-containers.backend = "docker";
}
