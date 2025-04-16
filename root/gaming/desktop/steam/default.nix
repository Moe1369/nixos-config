# Steam desktop client.
{ pkgs, ... }:
{
  programs.gamescope = {
    enable = true;
    capSysNice = true;
  };
  programs.steam = {
    enable = true;
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
    extraPackages = with pkgs;[
      gamescope
      mangohud
    ];
    gamescopeSession.enable = true;
    gamescopeSession.args = [
      "--hdr-enabled"
      "--hdr-itm-enable"
      "--adaptive-sync"
    ];
    gamescopeSession.steamArgs = [
      "-tenfoot"
      "-pipewire-dmabuf"
    ];
  };
}
