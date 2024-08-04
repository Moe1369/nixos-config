{ jovian,... }:
{
  imports =
    [ 
      # Packages
      ./packages/customizationpkgs.nix
      ./packages/devpkgs.nix
      ./packages/firefoxpkgs.nix
      ./packages/gamingpkgs.nix
      ./packages/hardwarepkgs.nix
      ./packages/miscpkgs.nix
      ./packages/plasmapkgs.nix
      ./packages/steampkgs.nix
      ./packages/systempkgs.nix
      # Settings
      ./system/boot.nix
      ./system/controller.nix
      ./system/desktop.nix
      ./system/hardware-configuration.nix
      ./system/hardware.nix
      ./system/locale.nix
      ./system/networking.nix
      ./system/systemd.nix
      ./system/systemsettings.nix
      ./system/updates.nix
      ./system/users.nix
    ];
  system.stateVersion = "24.05";
}
