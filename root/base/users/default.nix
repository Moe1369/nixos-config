# Define users. Hashed Password reused across devices.
{ user, ... }:
{
  users.users.${user} = {
    hashedPassword = "";
    description = "Mohamed Chrayed";
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
  };
}
