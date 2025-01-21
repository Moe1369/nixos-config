# Install GPU drivers.
{ ... }:
{
hardware.graphics = {
  enable = true;
  enable32Bit = true;
};
}
