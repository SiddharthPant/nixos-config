_: let
  shellConfig = import ../../lib/shell-config.nix {};
in {
  programs.bash = {
    enable = true;
    enableCompletion = true;
    shellAliases = shellConfig.aliases;
  };
}
