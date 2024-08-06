{ pkgs,... }:
{
  systemd.services.lact = {
    enable = true;
    description = "AMDGPU Control Daemon";
    after = ["multi-user.target"];
    wantedBy = ["multi-user.target"];
    serviceConfig = {
      ExecStart = "${pkgs.lact}/bin/lact daemon";
    };
   systemd.services.display-manager = {
     enable = true;
     conflicts = [ "plymouth-quit.service"];
     after = [ "plymouth-quit.service" "rc-local.service" "plymouth-start.service" "systemd-user-sessions.service"];
     OnFailure= ["plymouth-quit.service"];
     serviceConfig = {
       ExecStartPost= "sleep 30";
       ExecStartPost= "plymouth quit --retain-splash";
     };
   };
  };
}
