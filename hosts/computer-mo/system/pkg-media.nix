{ pkgs, ... }:
{
  environment.systemPackages =
   (with pkgs; [
    kdePackages.gwenview
    kdePackages.okular
    kdePackages.kdenlive
    kdePackages.elisa
    haruna
    krita
    ]);
}




