# Use LACT for GPU overclocking
{ pkgs,... }:
{
  environment.systemPackages =
   (with pkgs; [
    lact
    ]);

  # Enable Modprobe
  boot.extraModprobeConfig = ''
    options amdgpu ppfeaturemask=0xFFF7FFFF
 '';

  # Enable Systemd Service
  systemd.services.lact = {
    enable = true;
    description = "AMDGPU Control Daemon";
    after = ["multi-user.target"];
    wantedBy = ["multi-user.target"];
    serviceConfig = {
      ExecStart = "${pkgs.lact}/bin/lact daemon";
    };
  };
}
