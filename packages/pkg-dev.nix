{ pkgs, pkgs-stable, ... }:
{
  programs.zsh.enable = true;

  environment.systemPackages =
   (with pkgs; [
    git
    nil
    ])

    ++

   (with pkgs-stable; [

    ]);
}
