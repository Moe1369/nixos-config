{ pkgs, ... }:
{
  # Install gnome
  services.desktopManager.gnome.enable = true;
  services.xserver.enable = false;

  # Install Applications
  programs.file-roller.enable = true;
  services.gnome.tracker.enable = true;
  environment.systemPackages = with pkgs; [
  gnome-text-editor

  ];
  # Install Extensions
  environment.systemPackages = with pkgs; [
  gnomeExtensions.appindicator

  ];
  # Don't install unneeded applications
  environment.gnome.excludePackages = (with pkgs; [
  gnome-photos
  gnome-tour
  ]) ++ (with pkgs.gnome; [
  gnome-music
  gnome-terminal
  gedit
  epiphany
  geary
  evince
  gnome-characters
  totem
  tali
  iagno
  hitori
  atomix
  ]);
}
