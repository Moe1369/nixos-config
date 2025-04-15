# Steam desktop client.
{ pkgs, ... }:
{
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
