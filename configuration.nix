{ ... }:
{
  imports =
    [ 
      # Packages
      ./packages/pkg-customization.nix
      ./packages/pkg-desktop.nix
      ./packages/pkg-dev.nix
      ./packages/pkg-firefox.nix
      ./packages/pkg-gaming.nix
      ./packages/pkg-hardware.nix
      ./packages/pkg-media.nix
      ./packages/pkg-misc.nix
      ./packages/pkg-steam.nix
      ./packages/pkg-system.nix
      # Settings
      ./system/set-boot.nix
      ./system/set-controller.nix
      ./system/set-desktop.nix
      ./system/set-dev.nix
      ./system/set-filesystems.nix
      ./system/set-hardware.nix
      ./system/set-locale.nix
      ./system/set-networking.nix
      ./system/set-systemd.nix
      ./system/set-system.nix
      ./system/set-updates.nix
      ./system/set-users.nix
    ];
  system.stateVersion = "24.05";
}
