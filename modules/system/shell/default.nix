{ pkgs,  ... }:
{
  programs.zsh.enable = true;
  programs.zsh.enableCompletion = true;
  programs.zsh.ohMyZsh.enable = true;
  programs.zsh.ohMyZsh.theme = "agnoster";
  users.defaultUserShell = pkgs.zsh;
}
