# Steam desktop client.
{ user, ... }:
{
  jovian.steam.enable = true;
  jovian.steam.autoStart = false;
  jovian.steam.user = user;
  jovian.steam.desktopSession = "plasma";
}
