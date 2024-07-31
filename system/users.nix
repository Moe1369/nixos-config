{ config, pkgs, pkgs-unstable,... }:
{
  users.users.mo = {
    isNormalUser = true;
    description = "Mohamed Chrayed";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    ];
  };
}
