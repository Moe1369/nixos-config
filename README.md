## NixOS config

Daily Driver Nixos configuration.


### Todo

- [X] Better autoupgrade
- [X] Bash/ZSH Settings
- [ ] ssh key deployment with [agenix](https://github.com/ryantm/agenix)
- [x] alternative way to declare .nix files instead of dumping them into configuration.nix -> now uses groups in flake.nix
- [x] Multi Host functionality for homelab
- [X] OCI container for common services
- [X] Fix Home-Manager issues with immutable .config files during rebuild -> files kglobalshortcutsrc and kwinrc can't be overwritten because of plasma-manager
