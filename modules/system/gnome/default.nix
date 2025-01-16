{ pkgs, ... }:
{
  # Install gnome
  services.xserver.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Install Applications
  programs.file-roller.enable = true;
  services.gnome.tinysparql.enable = true;
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
  tsukimi
  gnomeExtensions.appindicator
  gnomeExtensions.rounded-window-corners-reborn
  gnomeExtensions.blur-my-shell
  gnomeExtensions.blur-my-light-shell
  gnomeExtensions.clipboard-indicator
  gnomeExtensions.middle-click-to-close-in-overview
  gnomeExtensions.wallpaper-slideshow
  gnomeExtensions.alphabetical-app-grid
  gnomeExtensions.night-theme-switcher
  ];
  # Don't install unneeded applications
  environment.gnome.excludePackages = (with pkgs; [
  xterm
  gnome-software
  gnome-connections
  gnome-maps
  gnome-weather
  gnome-photos
  gnome-tour
  gedit
  gnome-music
  gnome-terminal
  epiphany
  gnome-characters
  totem
  tali
  iagno
  hitori
  atomix
  ]);
}
