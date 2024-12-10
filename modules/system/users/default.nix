{ user, ... }:
{
  users.users.${user} = {
    hashedPassword = "$y$j9T$qziHkyBuG215vEKwqmoFl1$Pd1zqAsFlx1.kENKSn7BCWA1vHTLF2wlq7BQjFxgTu8";
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
  };
}
