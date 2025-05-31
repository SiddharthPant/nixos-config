_: let
  shellConfig = import ../../lib/shell-config.nix {};
in {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    history = {
      size = 100000;
      append = true;
      share = true;
      ignoreDups = true;
      findNoDups = true;
      saveNoDups = true;
      ignoreSpace = true;
      ignoreAllDups = true;
    };

    shellAliases = shellConfig.aliases;

    oh-my-zsh = {
      enable = true;
      plugins = ["git" "sudo" "docker" "kubectl"];
      theme = "robbyrussell";
    };
  };
}
