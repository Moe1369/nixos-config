# Define users. Hashed Password reused across devices.
{ user, ... }:
{
  users.users.${user} = {
    hashedPassword = "$y$j9T$qziHkyBuG215vEKwqmoFl1$Pd1zqAsFlx1.kENKSn7BCWA1vHTLF2wlq7BQjFxgTu8";
    description = "Mohamed Chrayed";
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
  };
}
