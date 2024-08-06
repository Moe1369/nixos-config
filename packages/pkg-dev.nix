{ pkgs, pkgs-stable, ... }:
{
  programs.zsh.enable = true;

  environment.systemPackages =
   (with pkgs; [
    git
    nil
    yaml-language-server
    ])

    ++

   (with pkgs-stable; [

    ]);
}
