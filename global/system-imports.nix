{ ... }:
{
  imports =
    [ 
      # Packages
      ./system-packages/sys.pkg-dev.nix
      # Settings
      ./system-settings/sys.set-boot.nix
      ./system-settings/sys.set-dev.nix
      ./system-settings/sys.set-locale.nix
      ./system-settings/sys.set-networking.nix
      ./system-settings/sys.set-system.nix
      ./system-settings/sys.set-updates.nix
      ./system-settings/sys.set-users.nix
    ];
}
