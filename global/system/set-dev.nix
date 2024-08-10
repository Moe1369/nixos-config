{ pkgs,  ... }:
{
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enableCompletion = true;
  programs.zsh.ohMyZsh.enable = true;
  programs.zsh.ohMyZsh.theme = "agnoster";
}
