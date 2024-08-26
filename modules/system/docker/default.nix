{ user, ... }:
{
  virtualisation.docker.enable = true;
  users.users.${user}.extraGroups = [ "docker" ];
  virtualisation.docker.daemon.settings = {
  data-root = "/docker/data-root";
};
}
