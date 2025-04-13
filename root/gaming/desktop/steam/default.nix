# Steam desktop client.
{ pkgs, ... }:
{
  programs.steam = {
    enable = true;
    extest.enable = true;
    gamescopeSession.enable = true;
    gamescopeSession.steamArgs = ["-tenfoot" "-pipewire-dmabuf"];
  };
  programs.gamescope.enable = true;
  environment.systemPackages =
   (with pkgs; [
    mangohud
     ]);
}
