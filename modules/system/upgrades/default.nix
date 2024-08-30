{ hostName, ... }:
{
nix.optimise.automatic = true;
nix.settings.auto-optimise-store = true;
nix.optimise.dates = [ "03:45" ];
system.autoUpgrade = {
    enable = true;
    dates = "04:00";
    persistent = true;
    flake = "github:Moe1369/nixos-config#${hostName}";
    flags = [
        "--update-input" "nixpkgs"
        "--update-input" "home-manager"
        "--update-input" "jovian"
        "--update-input" "nix-flatpak"
        "-L"
        "--commit-lock-file"
    ];
    allowReboot = true;
};
}
