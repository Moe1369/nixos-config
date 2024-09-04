{ user, hostName, pkgs, ... }:
{
dconf.settings = {
   "org/gnome/desktop/interface" = {
      font-name = "IBM Plex Sans 11";
      document-font-name = "IBM Plex Sans 11";
      monospace-font-name = "IBM Plex Mono 11";
      gtk-theme = "adw-gtk3";
      enable-hot-corners = false;
   };
   "org/gnome/desktop/background" = {
    color-shading-type = "solid";
    picture-options = "zoom";
    picture-uri = "file://" + /home/${user}/Bilder/Wallpaper/wallpaper-asia.jpg;
   };
 };
  home.file."Bilder/Wallpaper/wallpaper-nix.png".source = ../../../assets/wallpaper-nix.png;
  home.file."Bilder/Wallpaper/wallpaper-asia.jpg".source = ../../../assets/wallpaper-asia.jpg;
  home.file."Bilder/Wallpaper/wallpaper-kame.jpg".source = ../../../assets/wallpaper-kame.jpg;
  home.file."Bilder/Wallpaper/wallpaper-retrogirl.png".source = ../../../assets/wallpaper-retrogirl.png;
  home.file."Bilder/Wallpaper/wallpaper-sword.jpg".source = ../../../assets/wallpaper-sword.jpg;
  home.file."Bilder/Wallpaper/wallpaper-clouds.png".source = ../../../assets/wallpaper-clouds.png;
}
