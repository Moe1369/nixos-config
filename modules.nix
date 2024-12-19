{
  system = {
    base = [
      ./modules/system/apps-shell
      ./modules/system/bluetooth
      ./modules/system/boot
      ./modules/system/firmware
      ./modules/system/home-manager
      ./modules/system/input
      ./modules/system/locale
      ./modules/system/networking
      ./modules/system/nixsettings
      ./modules/system/printing
      ./modules/system/security
      ./modules/system/shell
      ./modules/system/sound
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
      ./container/authentik
      ./container/bazarr
      ./container/caddy
      ./container/emby
      ./container/jellyfin
      ./container/jellyseerr
      #./container/plex
      ./container/radarr
      ./container/recyclarr
      #./container/reiverr
      ./container/runtime
      ./container/sabnzbd
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
