{ pkgs, ... }
:{
  users.defaultUserShell = pkgs.zsh;
  users.users.mo.shell = pkgs.zsh;
  programs.zsh.enableCompletion = true;
  programs.zsh.ohMyZsh.enable = true;
  programs.zsh.ohMyZsh.theme = "agnoster";
}
