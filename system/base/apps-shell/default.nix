{ pkgs, ... }:
{
  environment.systemPackages =
   (with pkgs; [
    wget
    git
    nil
    yaml-language-server
    ]);
}
