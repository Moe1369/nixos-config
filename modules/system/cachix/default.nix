{ cachix, ... }:
  services.cachix = {
    enable = true;
    useNix = true;
    binaryCaches = [ "jovian245252" ];
  };
