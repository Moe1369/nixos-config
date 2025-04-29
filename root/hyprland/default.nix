{pkgs, ...}:
{
    programs.hyprland.enable = true;
    programs.waybar.enable = true;
    programs.hyprlock.enable = true;
    programs.uwsm.enable = true;
    programs.hyprland.withUWSM = true;
    environment.systemPackages = [
        pkgs.kitty
        pkgs.wofi
        pkgs.anyrun
        pkgs.ptyxis
        pkgs.hyprpolkitagent
    ];
}
