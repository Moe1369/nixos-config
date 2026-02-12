# SSH settings. Defined authorized internal key and enables key authentication.
{ user, ... }:
{
    services.openssh = {
        enable = true;
        settings.PasswordAuthentication = false;
        settings.KbdInteractiveAuthentication = false;
    };
    users.users.${user}.openssh.authorizedKeys.keys = [
        ""
    ];
}
