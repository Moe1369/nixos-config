{ pkgs, ... }:
{
  # Install gnome
  services.xserver.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Install Applications
  programs.file-roller.enable = true;
  services.gnome.tracker.enable = true;
  environment.systemPackages = with pkgs; [
  gnome-text-editor
  gnomeExtensions.appindicator

  ];
  # Don't install unneeded applications
  environment.gnome.excludePackages = (with pkgs; [
  gnome-photos
  gnome-tour
  gedit
  gnome-music
  gnome-terminal
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
