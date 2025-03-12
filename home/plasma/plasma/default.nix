{ user, hostName, ... }:
{
  home.file."Code/.directory".source = ./dotfiles/code-folder;
  home.file.".config/haruna/haruna.conf".source = ./dotfiles/haruna-config;
  #home.file.".config/kwinrulesrc".source = ./dotfiles/kwin-rules;
  home.file.".local/share/user-places.xbel".source = ./dotfiles/userplaces-${hostName};
  home.file.".config/kglobalshortcutsrc".source = ./dotfiles/kdeshortcuts-config;
  #home.file.".config/kwinrc".source = ./dotfiles/kwin-config;
  #home.file.".config/klassy/klassyrc".source = ./dotfiles/klassy-config;
  #home.file.".config/klassy/windecopresetsrc".source = ./dotfiles/kwindecoration-config;
  home.file.".config/krunnerrc".source = ./dotfiles/krunner-config;
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
    kscreenlocker.appearance.wallpaper = "/home/${user}/Bilder/Wallpaper/wallpaper-beach.png";
    kscreenlocker.lockOnResume = false;
    kscreenlocker.lockOnStartup = false;
    kscreenlocker.passwordRequired = false;
    powerdevil.AC.dimDisplay.enable = false;
    powerdevil.AC.turnOffDisplay.idleTimeoutWhenLocked = 600;
    session.general.askForConfirmationOnLogout = false;
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
      theme = "Breeze_Light";
    };
    workspace.lookAndFeel = "org.kde.breeze.desktop";
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
                "applications:org.kde.gwenview.desktop"
                "applications:org.kde.kwrite.desktop"
                "applications:org.kde.kate.desktop"
                "applications:steam.desktop"
                "applications:vesktop.desktop"
                "applications:org.kde.plasma-systemmonitor.desktop"
                "applications:systemsettings.desktop"
                "applications:org.kde.filelight.desktop"
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
