{ user, ... }:
{
  # Only use sddm on Computer-Mo.
  services.displayManager =  {
    sddm.wayland.enable = true;
    sddm.enable = true;
    autoLogin.enable = true;
    autoLogin.user = user;
  };
}
