{ config, pkgs, pkgs-unstable, ... }:
{
  imports =
    [ 
      ./system/boot.nix
      ./system/controller.nix
      ./system/desktop.nix
      ./system/hardware-configuration.nix
      ./system/hardware.nix
      ./system/locale.nix
      ./system/networking.nix
      ./system/systempkgs.nix
      ./system/systemsettings.nix
      ./system/updates.nix
      ./system/users.nix
    ];
  system.stateVersion = "24.05";
}
