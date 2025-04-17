{ pkgs, ... }:

  pkgs.writeShellScriptBin "steamos-select-branch" ''
  echo "Not applicable for this OS
''
  pkgs.writeShellScriptBin "steamos-select-branch" ''
    steam -shutdown
''
