{
  system = {
    workstation = [
      ./hosts/workstation
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
      ./modules/system/jovian-workstation
      ./modules/system/lact
      ./modules/system/steam
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
    plasma = [
      ./modules/user/plasma
    ];
    gaming = [
      ./modules/user/steam
    ];
    container = [];
  };
}
