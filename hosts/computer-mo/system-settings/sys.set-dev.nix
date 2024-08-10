{ pkgs, user,  ... }:
{
  users.defaultUserShell = pkgs.zsh;
  users.users.${user}.shell = pkgs.zsh;
  programs.zsh.enableCompletion = true;
  programs.zsh.ohMyZsh.enable = true;
  programs.zsh.ohMyZsh.theme = "agnoster";
}
