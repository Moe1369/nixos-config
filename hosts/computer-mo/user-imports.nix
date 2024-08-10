{ ... }:

{
  imports = [
   # Home-Manager Packages
   ./user-packages/usr.pkg-desktop.nix
   # Home-Manager Settings
   ./user-settings/usr.set-customization.nix
   ./user-settings/usr.set-dotfiles.nix
   ./user-settings/usr.set-desktop.nix
  ];
}
