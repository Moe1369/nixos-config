{ pkgs, ... }
:{
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enableCompletion = true;
}
