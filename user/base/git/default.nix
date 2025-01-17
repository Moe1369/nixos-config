{ ... }:
{
  programs.git = {
   enable = true;
   userName = "Mohamed C.";
   userEmail = "mohamed@chrayed.de";
   extraConfig = {
     init.defaultBranch = "main";
     core.editor = "nano";
   };
  };
}
