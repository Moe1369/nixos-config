{
  system = {
    base = hostName: [
      ./hosts/${hostName}
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
    gnome = hostName: [
      ./modules/system/apps-misc
      ./modules/system/browser
      ./modules/system/gnome
    ];
    plasma = hostName: [
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
    gaming = hostName: [
      ./modules/system/controller
      ./modules/system/jovian-${hostName}
      ./modules/system/lact
      ./modules/system/steam
    ];
    server = [
      ./modules/system/docker
    ];
  };

  # Define grouped modules for user configuration
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
    server = [];
  };
}
