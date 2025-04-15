# Steam desktop client.
{ pkgs, ... }:
{
  programs.gamescope = {
    enable = true;
    capSysNice = true;
  };
  programs.opengamepadui = {
    enable = true;
    inputplumber.enable = true;
    gamescopeSession.enable = true;
    gamescopeSession.args = [
      "--hdr-enabled"
    ];
  };
  programs.steam = {
    enable = true;
    extest.enable = true;

    extraCompatPackages = with pkgs; [
      proton-ge-bin
      steamtinkerlaunch
    ];
    extraPackages = with pkgs;[
      gamescope
      mangohud
    ];
    gamescopeSession.enable = true;
    gamescopeSession.args = [
      "--hdr-enabled"
    ];
    gamescopeSession.steamArgs = [
      "-tenfoot"
      "-pipewire-dmabuf"
    ];
  };
}
