{ pkgs, ... }:
{
  environment.systemPackages =
   (with pkgs; [
    kdePackages.kate
    git
    nil
    yaml-language-server
    ]);
}
