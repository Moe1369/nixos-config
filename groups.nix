{
  system = {
    workstation = [
      ./hosts/workstation
    ];
    konsole = [
      ./hosts/konsole
    ];
    steamdeck = [
      ./hosts/steamdeck
    ];
    server = [
      ./hosts/server
    ];
    base = [
      ./modules/system/apps-shell
      ./modules/system/boot
      ./modules/system/devices
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
    gnome = [
      ./modules/system/apps-misc
      ./modules/system/browser
      ./modules/system/gnome
    ];
    plasma = [
      ./modules/system/apps-misc
      ./modules/system/browser
      ./modules/system/plasma
      ./modules/system/plasma-nur
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
    container = [
      ./modules/system/docker
    ];
  };

  user = {
    base = [
      ./modules/user/git
      ./modules/user/homeversion
      ./modules/user/shell
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
    container = [];
  };
}
