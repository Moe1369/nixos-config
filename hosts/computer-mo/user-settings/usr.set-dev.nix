{ ... }:
{
  programs.git = {
   userName = "Mohamed C.";
   userEmail = "mohamed@chrayed.de";
   extraConfig = {
     init.defaultBranch = "main";
   };
  };
}
