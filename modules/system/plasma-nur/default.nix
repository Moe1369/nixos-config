({ config,nur,nixos, pkgs, ... }: {
 environment.systemPackages = [ config.nur.repos.shadowrz.klassy-qt6 ];
})
