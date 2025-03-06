{ pkgs, ... }:
{
  system.activationScripts.network-internal = ''
    ${pkgs.docker}/bin/docker network create network-internal
  '';
  virtualisation.docker = {
    enable = true;
    autoPrune.enable = false;
  };
  virtualisation.oci-containers.backend = "docker";
}
