{ user, ... }:
{
  home.file."Code/.directory".source = ../../../dotfiles/directory;
  home.file.".config/haruna/haruna.conf".source = ../../../dotfiles/haruna.conf;
  home.file.".local/share/color-schemes/BreezeDunkelFarbe.colors".source = ../../../dotfiles/BreezeDunkelFarbe.colors;
  home.file.".local/share/color-schemes/BreezeHellFarbe.colors".source = ../../../dotfiles/BreezeHellFarbe.colors;
  home.file.".config/kglobalshortcutsrc".source = ../../../dotfiles/kglobalshortcutsrc;
  home.file."Bilder/Wallpaper/wallpaper-nix.png".source = ../../../assets/wallpaper-nix.png;
  home.file."Bilder/Wallpaper/wallpaper-asia.jpg".source = ../../../assets/wallpaper-asia.jpg;
  home.file."Bilder/Wallpaper/wallpaper-kame.jpg".source = ../../../assets/wallpaper-kame.jpg;
  home.file."Bilder/Wallpaper/wallpaper-retrogirl.png".source = ../../../assets/wallpaper-retrogirl.png;
  home.file.".config/kwinrc".source = ../../../dotfiles/kwinrc;
  home.file.".config/kwinoutputconfig.json".source = ../../../dotfiles/kwinoutputconfig.json;
  home.file.".local/share/user-places.xbel".source = ../../../dotfiles/user-places.xbel;


  programs.plasma = {

    enable = true;
    workspace.wallpaperSlideShow.path = home/mo/Bilder/Wallpaper;
    #workspace.wallpaper = "/home/mo/Bilder/Wallpaper/wallpaper-nix.png";
    kscreenlocker.appearance.wallpaper = "/home/mo/Bilder/Wallpaper/wallpaper-nix.png";

    kwin.titlebarButtons.left = ["keep-above-windows"];
    kwin.titlebarButtons.right = ["minimize" "maximize" "close"];

    fonts = {
    menu.family = "IBM Plex Sans";
    menu.pointSize = 10;
    menu.weight = "normal";
    general.family = "IBM Plex Sans";
    general.pointSize = 10;
    general.weight = "normal";
    small.family = "IBM Plex Sans";
    small.pointSize = 8;
    small.weight = "normal";
    toolbar.family = "IBM Plex Sans";
    toolbar.pointSize = 10;
    toolbar.weight = "normal";
    fixedWidth.family = "IBM Plex Mono";
    fixedWidth.pointSize = 12;
    fixedWidth.weight = "normal";
    windowTitle.family = "IBM Plex Sans";
    windowTitle.pointSize = 12;
    windowTitle.weight = "medium";
    };

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
