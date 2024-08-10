# Packages for Development
{ pkgs, pkgs-stable, ... }:
{
  programs.zsh.enable = true;

  environment.systemPackages =
   (with pkgs; [
    kdePackages.kate
    git
    nil
    yaml-language-server
    ])

    ++

   (with pkgs-stable; [

    ]);
}
