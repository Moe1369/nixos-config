{ hostName, ... }:
{
system.autoUpgrade = {
    enable = true;
    dates = "04:00";
    flake = "github:Moe1369/nixos-config#${hostName}";
    flags = [
        "--update-input" "nixpkgs" "-L" "--commit-lock-file"
    ];
    allowReboot = true;
};
}
