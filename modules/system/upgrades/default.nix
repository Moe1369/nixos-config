{ hostName, ... }:
{
    nix.optimise.automatic = false;
    nix.settings.auto-optimise-store = false;
    nix.optimise.dates = [ "03:45" ];
    system.autoUpgrade = {
        enable = true;
        dates = "04:00";
        persistent = true;
        flake = "github:Moe1369/nixos-config#${hostName}";
        flags = [
        ];
        allowReboot = false;
    };
}
