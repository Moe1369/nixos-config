{ ... }:
{
  home.file."./.ssh/config".source = ../../../dotfiles/ssh-config;
  home.file."/root/.ssh/config".source = ../../../dotfiles/ssh-config;
}
