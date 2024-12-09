({ config,nur,nixos, pkgs, ... }: {
 environment.systemPackages = [ nur.repos.shadowrz.klassy-qt6 ];
})
