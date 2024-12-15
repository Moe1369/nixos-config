{
  system = {
    base = [
      ./modules/system/apps-shell
      ./modules/system/boot
      ./modules/system/bluetooth
      ./modules/system/printing
      ./modules/system/input
      ./modules/system/security
      ./modules/system/sound
      ./modules/system/firmware
      ./modules/system/home-manager
      ./modules/system/locale
      ./modules/system/networking
      ./modules/system/nixsettings
      ./modules/system/shell
      ./modules/system/ssh
      ./modules/system/systemversion
      ./modules/system/upgrades
      ./modules/system/users
    ];
    cpu.amd = [
      ./modules/system/cpu-amd
    ];
    cpu.intel = [
      ./modules/system/cpu-intel
    ];
    container = [
      ./container/runtime
      ./container/authentik
      ./container/bazarr
      ./container/jellyseerr
      ./container/emby
      ./container/radarr
      ./container/sonarr
    ];
    filesystem.client = [
      ./modules/system/filesystem-client
    ];
    filesystem.server = [
      ./modules/system/filesystem-server
    ];
    gnome = [
      ./modules/system/apps-misc
      ./modules/system/browser
      ./modules/system/gnome
    ];
    plasma = [
      ./modules/system/apps-misc
      ./modules/system/browser
      ./modules/system/plasma
    ];
    gdm = [
      ./modules/system/gdm
    ];
    sddm = [
      ./modules/system/sddm
    ];
    gaming = [
      ./modules/system/controller
      ./modules/system/lact
      ./modules/system/steam
    ];
    jovian.workstation = [
      ./modules/system/jovian-workstation
    ];
    jovian.konsole = [
      ./modules/system/jovian-konsole
    ];
    jovian.steamdeck = [
      ./modules/system/jovian-steamdeck
    ];
  };

  user = {
    base = [
      ./modules/user/git
      ./modules/user/homeversion
      ./modules/user/shell
      ./modules/user/ssh
    ];
    gnome = [
      ./modules/user/gnome
    ];
    plasma = [
      ./modules/user/plasma
    ];
    gaming = [
      ./modules/user/steam
    ];
  };
}
