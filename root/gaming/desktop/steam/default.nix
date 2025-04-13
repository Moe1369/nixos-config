# Steam desktop client.
{ pkgs, ... }:
{
  programs.steam = {
    enable = true;
    extest.enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
    gamescope.enable = true;
    gamescopeSession.enable = true;
    gamescopeSession.steamArgs = ["-tenfoot" "-pipewire-dmabuf"];
  };
  environment.systemPackages =
   (with pkgs; [
    mangohud
     ]);
}
