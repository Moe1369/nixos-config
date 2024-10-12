{ user, ... }:
{
  users.users.${user} = {
    isNormalUser = true;
    name = "Mohamed Chrayed";
    extraGroups = [ "wheel" "networkmanager" "decky" ];
  };
}
