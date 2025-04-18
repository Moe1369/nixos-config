{ pkgs, ... }:
# Scripts for SteamOS session
let
  jupiter-biosupdate = pkgs.writeShellScriptBin "jupiter-biosupdate" ''
    exit 0;
  '';

  steamos-update = pkgs.writeShellScriptBin "steamos-update" ''
    exit 7;
  '';

  steamos-select-branch = pkgs.writeShellScriptBin "steamos-select-branch" ''
    echo "Not applicable for this OS"
  '';

  steamos-session-select = pkgs.writeShellScriptBin "steamos-session-select" ''
    steam -shutdown
  '';
in
{
  environment.systemPackages = [
    jupiter-biosupdate
    steamos-update
    steamos-select-branch
    steamos-session-select
  ];
  hardware.steam-hardware.enable = true;
  programs.steam = {
    enable = true;
    extest.enable = true;
    gamescopeSession.enable = true;
    gamescopeSession.args = [
      "--mangoapp"
    ];
    gamescopeSession.steamArgs = [
      "-steamdeck"
      "-steamos3"
    ];
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
    extraPackages = with pkgs; [
      gamescope
      mangohud
      vulkan-hdr-layer-kwin6
    ];
  };
}
