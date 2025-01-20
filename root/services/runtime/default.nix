{ pkgs, ... }:
{
  system.activationScripts.network-internal = ''
    ${pkgs.docker}/bin/docker network create network-internal
  '';
  system.activationScripts.network-external = ''
    ${pkgs.docker}/bin/docker network create network-external
  '';
  virtualisation.docker = {
    enable = true;
    autoPrune.enable = false;
    rootless = true;
    setSocketVariable = true;
  };
  virtualisation.oci-containers.backend = "docker";
}
