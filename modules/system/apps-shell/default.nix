{ pkgs, agenix, ... }:
{
  environment.systemPackages =
   (with pkgs; [
    git
    nil
    yaml-language-server
    ]);
}
