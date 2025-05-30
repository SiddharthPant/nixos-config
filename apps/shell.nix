_: {
  programs = {
    bash = {
      enable = true;
      enableCompletion = true;
      shellAliases = {
        ls = "eza --color --icons";
        ll = "ls -l";
        la = "ls -la";
        ".." = "cd ..";
        "..." = "cd ../..";
        grep = "grep --color=auto";
        cat = "bat";
      };
    };

    zsh = {
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

      shellAliases = {
        ls = "eza --color --icons";
        ll = "ls -l";
        la = "ls -la";
        ".." = "cd ..";
        "..." = "cd ../..";
        grep = "grep --color=auto";
        cat = "bat";
      };

      oh-my-zsh = {
        enable = true;
        plugins = ["git" "sudo" "docker" "kubectl"];
        theme = "robbyrussell";
      };
    };
  };
}
