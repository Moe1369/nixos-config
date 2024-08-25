{ pkgs, ... }:
{

  systemd.user.services.steam = {
    enable = true;
    description = "Open Steam in the background at boot";
    serviceConfig = {
      ExecStart = "${pkgs.steam}/bin/steam -nochatui -nofriendsui -silent %U";
      wantedBy = [ "graphical-session.target" ];
      Restart = "on-failure";
      RestartSec = "5s";
    };
  };

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };
  environment.systemPackages = [
    pkgs.gamescope
  ];
}
