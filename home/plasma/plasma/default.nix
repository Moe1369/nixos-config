{ user, hostName, ... }:
{
  home.file."Code/.directory".source = ./dotfiles/code-folder;
  home.file.".config/haruna/haruna.conf".source = ./dotfiles/haruna-config;
  home.file.".local/share/user-places.xbel".source = ./dotfiles/userplaces-${hostName};
  home.file.".config/kde-material-you-colors/config.conf".source = ./dotfiles/kmyc-config;
  home.file.".config/autostart/kde-material-you-colors.desktop".source = ./dotfiles/kmyc-desktop;
  home.file.wallpaper = {
    recursive = true;
    source = ../../../assets;
    target = "Bilder/Wallpaper";
  };

  programs.plasma = {
    enable = true;
    immutableByDefault = false;
    workspace.wallpaperSlideShow.path = /home/${user}/Bilder/Wallpaper;
    workspace.wallpaperSlideShow.interval = 864000;
    workspace.windowDecorations.library = "org.kde.klassy";
    workspace.windowDecorations.theme = "Klassy";
    kscreenlocker.appearance.wallpaper = "/home/${user}/Bilder/Wallpaper/wallpaper-beach.png";
    kscreenlocker.lockOnResume = false;
    kscreenlocker.lockOnStartup = false;
    kscreenlocker.passwordRequired = false;
    powerdevil.AC.dimDisplay.enable = false;
    powerdevil.AC.turnOffDisplay.idleTimeoutWhenLocked = 600;
    session.general.askForConfirmationOnLogout = false;
    fonts = {
    menu.family = "Adwaita Sans";
    menu.pointSize = 10;
    menu.weight = "normal";
    general.family = "Adwaita Sans";
    general.pointSize = 10;
    general.weight = "normal";
    small.family = "Adwaita Sans";
    small.pointSize = 8;
    small.weight = "normal";
    toolbar.family = "Adwaita Sans";
    toolbar.pointSize = 10;
    toolbar.weight = "normal";
    fixedWidth.family = "Adwaita Mono";
    fixedWidth.pointSize = 11;
    fixedWidth.weight = "normal";
    windowTitle.family = "Adwaita Sans";
    windowTitle.pointSize = 12;
    windowTitle.weight = "normal";
    };
    workspace.cursor = {
      size = 24;
      theme = "Breeze_Light";
    };
    #workspace.lookAndFeel = "org.kde.breeze.desktop";
    workspace.colorScheme = "MaterialYouLight";
    panels = [
    {
      location = "bottom";
      floating = true;
      alignment = "center";
      height = 46;
      lengthMode = "fit";
      hiding = "dodgewindows";
      widgets  = [
          {
          name = "org.kde.plasma.kickoff";
          config = {
            General = {
              icon = "nix-snowflake";
            };
            };
          }
          "org.kde.plasma.marginsseparator"
        {
            iconTasks = {
              launchers = [
                "applications:org.kde.dolphin.desktop"
                "applications:org.kde.konsole.desktop"
                "applications:google-chrome.desktop"
                "applications:org.kde.kate.desktop"
                "applications:steam.desktop"
                "applications:vesktop.desktop"
                "applications:org.kde.plasma-systemmonitor.desktop"
                "applications:systemsettings.desktop"
              ];
            };
        }
        "org.kde.plasma.marginsseparator"
         {
            systemTray.items = {
              shown = [
                "org.kde.plasma.bluetooth"
                "org.kde.plasma.networkmanagement"
              ];
            };
          }
          {
            digitalClock = {
              calendar.firstDayOfWeek = "monday";
              time.format = "24h";
            };
          }
        ];
      }
    ];
    };
}
