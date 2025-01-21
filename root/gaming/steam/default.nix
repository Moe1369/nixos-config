# Steam desktop client.
{ pkgs, ... }:
{
  programs.steam = {
    enable = true;
    # Enable extest so controller works in desktop mode.
    extest.enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };
  environment.systemPackages =
   (with pkgs; [
    gamescope
    mangohud
    protonup-qt
    ]);
}
