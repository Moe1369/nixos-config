{ ... }:
{
system.autoUpgrade = {
    enable = true;
    dates = "04:00";
    flake = "github:Moe1369/nixos-config";
    flags = [
        "--update-input" "nixpkgs" "--commit-lock-file"
    ];
    allowReboot = true;
};
}
