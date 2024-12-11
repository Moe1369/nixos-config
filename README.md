## NixOS config

Personal NixOS configuration mostly used for learning the Nix language. Makes use of the experimental Flake and Home-Manager features.

Mirrored on [gitea.chrayed.de](https://gitea.chrayed.de/moe1369/nixos-config)

### Todo

- [X] Better autoupgrade
- [X] Bash/ZSH Settings
- [ ] use [agenix](https://github.com/ryantm/agenix)
- [x] alternative way to declare .nix files instead of dumping them into configuration.nix -> now uses groups in flake.nix
- [x] Multi Host functionality for homelab
- [ ] OCI container for common services -> learn about 
- [X] Fix Home-Manager issues with immutable .config files during rebuild -> files kglobalshortcutsrc and kwinrc can't be overwritten because of plasma-manager
- [ ] Don't use hashed Password for user creation
- [ ] Smarter and more flexible folder layout
  - [ ] export as much as possible from flake.nix to make it more clean
- [ ] autoupgrade should clean every generation except the last 2
- [ ] use cachix for long build times on steamdeck
- [ ] Fix Konsole sleep issue when TV is off (Signal gets lost - reboot needed)
