{ config, pkgs, pkgs-stable,... }:
{
  users.users.mo = {
    isNormalUser = true;
    description = "Mohamed Chrayed";
    extraGroups = [ "networkmanager" "wheel" ];
  };
  users.users.deck = {
    isNormalUser = true;
    description = "Steam Deck";
    extraGroups = [ "networkmanager" ];
  };
}
