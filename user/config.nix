{ config, pkgs, pkgs-stable, ... }:
{
home.file.".config/haruna/haruna.conf".source = ../configs/haruna.conf;
home.file.".local/share/color-schemes/BreezeDunkelFarbe.colors".source = ../configs/BreezeDunkelFarbe.colors;
home.file.".local/share/color-schemes/BreezeHellFarbe.colors".source = ../configs/BreezeHellFarbe.colors;
home.file.".config/kglobalshortcutsrc".source = ../configs/kglobalshortcutsrc;
}