{ user, ... }:
{
  users.users.${user} = {
    isNormalUser = true;
    description = "Mohamed Chrayed";
    extraGroups = [ "networkmanager" "wheel" ];
  };
}
