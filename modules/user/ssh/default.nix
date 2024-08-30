{ user, ... }:
{
users.users.${user}.openssh.authorizedKeys.keys = [
"ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEun1YkEfxTpcsQk7ZIwuVTcSsVHjwuKA7xOW4TAi3SE mo@workstation"
];
}
