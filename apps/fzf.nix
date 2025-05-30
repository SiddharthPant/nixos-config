_: {
  programs.fzf = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    tmux.enableShellIntegration = true;

    defaultCommand = "rg --files --ignore-vcs --hidden";
  };
}
