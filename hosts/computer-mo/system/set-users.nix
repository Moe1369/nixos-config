{ user-computer, ... }:
{
  users.users.${user-computer} = {
    isNormalUser = true;
    description = "Mohamed Chrayed";
    extraGroups = [ "networkmanager" "wheel" ];
  };
}
