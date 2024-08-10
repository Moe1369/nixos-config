{ pkgs, ... }:
{
  environment.systemPackages =
   (with pkgs; [
    pciutils
    aha
    lact
    kdePackages.isoimagewriter
    ]);
}
