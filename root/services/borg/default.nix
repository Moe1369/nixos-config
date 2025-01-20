{pkgs, ...}:
{
    services.borgbackup.jobs."server" = {
        paths = "/var/lib/docker";
        encryption.mode = "none";
        environment.BORG_RSH = "ssh -i /home/administrator/.ssh/extern";
        repo = "ssh://x";
        compression = "auto,zstd";
        startAt = "daily";
    };
}