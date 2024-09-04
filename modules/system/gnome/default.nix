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
  dconf-editor
  mission-center
  amberol
  clapper
  video-trimmer
  diebahn
  commit
  cartridges
  gnome-obfuscate
  gnome-tweaks
  adw-gtk3
  adwsteamgtk
  gdm-settings
  gnomeExtensions.appindicator
  gnomeExtensions.rounded-window-corners-reborn
  gnomeExtensions.clipboard-indicator
  gnomeExtensions.wallpaper-slideshow
  ];
  # Don't install unneeded applications
  environment.gnome.excludePackages = (with pkgs; [
  xterm
  gnome-software
  gnome-contacts
  gnome-connections
  gnome-maps
  gnome-weather
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
