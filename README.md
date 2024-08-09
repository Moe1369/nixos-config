## NixOS config

Personal NixOS configuration mostly used for learning the Nix language. Makes use of the experimental Flake and Home-Manager features.

Mirrored on [gitea.chrayed.de](https://gitea.chrayed.de/moe1369/nixos-config)

### Todo

- [X] Better autoupgrade
- [X] Bash/ZSH Settings
- [ ] ssh key deployment with [agenix](https://github.com/ryantm/agenix)
- [ ] alternative way to declare .nix files instead of dumping them into configuration.nix
- [ ] Multi Host functionality for homelab - preferably [conditional implementation](https://nixos.wiki/wiki/Extend_NixOS#Conditional_Implementation)
- [ ] OCI container for common services
- [ ] Fix Home-Manager issues with immutable .config files during rebuild
