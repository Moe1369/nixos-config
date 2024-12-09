{ pkgs, ... }:
{
  environment.systemPackages =
   (with pkgs; [
    cachix
    git
    nil
    yaml-language-server
    ]);
}
