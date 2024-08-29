{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.alpaca
  ];

services.ollama = {
  enable = true;
  acceleration = "rocm";
    environmentVariables = {
      HCC_AMDGPU_TARGET = "gfx1100";
      HSA_OVERRIDE_GFX_VERSION="11.0.0";
    };
};
}
