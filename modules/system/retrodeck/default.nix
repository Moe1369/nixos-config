{ ... }:
{
  services.flatpak.enable = true;
  services.flatpak.update.onActivation = true;
  services.flatpak.packages = [
    { appId = "net.retrodeck.retrodeck"; origin = "flathub";  }
  ];
}
