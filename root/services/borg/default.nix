{pkgs, ...}:
{
    services.borgbackup.jobs."server" = {
        paths = "/var/lib/docker";
        encryption.mode = "none";
        environment.BORG_RSH = "ssh -i /home/administrator/.ssh/extern";
        repo = "ssh://q1wxyk20@q1wxyk20.repo.borgbase.com/./repo";
        compression = "auto,zstd";
        startAt = "daily";
    };
}