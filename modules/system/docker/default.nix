{ user, ... }:
{
  virtualisation.docker = {
    enable = true;
    autoPrune.enable = true;
    daemon.settings.data-root =  "/container/data-root";
  };
  virtualisation.oci-containers.backend = "docker";
  users.users.${user}.extraGroups = [ "docker" ];
}
