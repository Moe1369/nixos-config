{pkgs, ...}:
{
    services.borgbackup.jobs."server" = {
        paths = "/var/lib/docker";
        encryption.mode = "repokey-blake2";
        encryption.passCommand = "cat /root/passphrase";
        environment.BORG_RSH = "ssh -i /home/administrator/.ssh/extern";
        repo = "e6cr76lv@e6cr76lv.repo.borgbase.com:repo";
        compression = "auto,zstd";
        startAt = "daily";
    };
}
