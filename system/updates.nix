{ config, pkgs, pkgs-stable, ... }:
{
system.autoUpgrade = {
    enable = true;
    dates = "04:00";
    flake = "../flake.nix";
    flags = [
        "--update-input" "nixpkgs" "--commit-lock-file"
    ];
    allowReboot = true;
};
}
