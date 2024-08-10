{ pkgs, ... }:
{
  programs.zsh.enable = true;

  environment.systemPackages =
   (with pkgs; [
    kdePackages.kate
    git
    nil
    yaml-language-server
    ]);
}
