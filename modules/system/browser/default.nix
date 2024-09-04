{ ... }:
{
  environment.systemPackages =
   (with pkgs; [
    google-chrome
    ]);
}
