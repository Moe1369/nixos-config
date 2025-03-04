{ pkgs, user,  ... }:
{
  # Install plasma without xserver. Use wayland.
  services.desktopManager.plasma6.enable = true;
  services.xserver.enable = true;
  # Install applications.
  environment.systemPackages =
   (with pkgs; [
    nur.repos.shadowrz.klassy-qt6
    kde-rounded-corners
    kdePackages.kate
    kdePackages.isoimagewriter
    kdePackages.gwenview
    kdePackages.okular
    kdePackages.kdenlive
    kdePackages.elisa
    kdePackages.wallpaper-engine-plugin
    haruna
    krita
    kdePackages.kcolorchooser
    kdePackages.kfind
    kdePackages.kcalc
    kdePackages.filelight
    kdePackages.skanlite
    kdePackages.ksystemlog
    kdePackages.partitionmanager
    kdePackages.plasma-browser-integration
    python312Packages.kde-material-you-colors
    pywal
    ]);

  # Needed for proper rebuild
  system.activationScripts.deleteFile = ''
    rm -f /home/${user}/.config/kglobalshortcutsrc
  '';

}
