# Firefox Package; use programs.firefox
{ ... }:
{
  programs.firefox = {
    enable = true;
    languagePacks = ["de"];
  };
}
