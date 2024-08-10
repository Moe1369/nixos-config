{ ... }:
{
  imports =
    [ 
      # Packages
      ./system-packages/sys.pkg-customization.nix
      ./system-packages/sys.pkg-desktop.nix
      ./system-packages/sys.pkg-dev.nix
      ./system-packages/sys.pkg-firefox.nix
      ./system-packages/sys.pkg-gaming.nix
      ./system-packages/sys.pkg-hardware.nix
      ./system-packages/sys.pkg-media.nix
      ./system-packages/sys.pkg-misc.nix
      ./system-packages/sys.pkg-steam.nix
      ./system-packages/sys.pkg-system.nix
      # Settings
      ./system-settings/sys.set-boot.nix
      ./system-settings/sys.set-controller.nix
      ./system-settings/sys.set-desktop.nix
      ./system-settings/sys.set-filesystems.nix
      ./system-settings/sys.set-hardware.nix
      ./system-settings/sys.set-steam.nix
      ./system-settings/sys.set-systemd.nix
    ];
}
