{ pkgs, ...}: {
environment.systemPackages =
   (with pkgs; [
    nur.repos.shadowrz.klassy-qt6
    kdePackages.kate
    kdePackages.isoimagewriter
    kdePackages.gwenview
    kdePackages.okular
    kdePackages.kdenlive
    kdePackages.elisa
    kdePackages.wallpaper-engine-plugin
    kdePackages.qtwebengine
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
    kdePackages.koi
    python312Packages.kde-material-you-colors
    kdePackages.alpaka
    pywal
    ]);
services.ollama = {
  enable = true;
  loadModels = [ "codellama" "llama3.2" ];
  acceleration = "rocm";
  rocmOverrideGfx = "10.3.0";
};
}
