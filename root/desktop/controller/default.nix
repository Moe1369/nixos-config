{ ... }:
{
  # Ignore Dualsense touchpad in desktop mode.
  services.udev.extraRules =''
    ACTION=="add|change", KERNEL=="event[0-9]*", ATTRS{name}=="*Wireless Controller Touchpad", ENV{LIBINPUT_IGNORE_DEVICE}="1"
  '';
}
