{ ... }:
{

  environment.systemPackages =
   (with pkgs; [
    ollama-rocm
    ]);
}
