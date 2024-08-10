{ pkgs, pkgs-stable, ... }:
{
  environment.systemPackages =
   (with pkgs; [
    kdePackages.gwenview
    kdePackages.okular
    kdePackages.kdenlive
    kdePackages.elisa
    haruna
    krita
    ])

    ++

   (with pkgs-stable; [

    ]);
}




