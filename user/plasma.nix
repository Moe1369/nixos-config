{ plasma-manager, pkgs, pkgs-stable, ... }:
{
  programs.plasma = {
    enable = true;

    workspace.cursor = {
      size = 24;
      theme = "Breeze_Snow";
    };
    workspace.colorScheme = "BreezeHellFarbe";
    panels = [
    {
      location = "bottom";
      floating = true;
      alignment = "center";
      height = 46;
      lengthMode = "fit";
      hiding = "dodgewindows";
      widgets  = [
        "org.kde.plasma.kickoff"
        "org.kde.plasma.icontasks"
      ];
      }
    {
      location = "bottom";
      floating = true;
      alignment = "right";
      height = 36;
      lengthMode = "fit";
      hiding = "dodgewindows";
      widgets  = [
        "org.kde.plasma.systemtray"
        "org.kde.plasma.digitalclock"
      ];
    }
    ];
    };
}
