{ pkgs, ... }:
{
  programs.steam = {
    enable = true;
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
