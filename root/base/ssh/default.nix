# SSH settings. Defined authorized internal key and enables key authentication.
{ user, ... }:
{
    services.openssh = {
        enable = true;
        settings.PasswordAuthentication = false;
        settings.KbdInteractiveAuthentication = false;
    };
    users.users.${user}.openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAxNhl9lAA7SGpFv0/YhIrL+C1nrODGsvpXlevjpOP9d Interne Infrastruktur"
    ];
}
