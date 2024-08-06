{ ... }:
{
system.autoUpgrade = {
    enable = true;
    dates = "04:00";
    flake = "github:Moe1369/nixos-config";
    flags = [
        "--update-input" "nixpkgs" "nixpkgs-stable" "--commit-lock-file"
    ];
    allowReboot = true;
};
}
