{ config, pkgs, pkgs-stable, ... }:
{
home.file."~/.config/haruna/haruna.conf".source = ../haruna.conf;
}
