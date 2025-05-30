_: {
  programs.kitty = {
    enable = true;

    font = {
      name = "Maple Mono NF";
    };

    shellIntegration.enableZshIntegration = true;

    settings = {
      enable_audio_bell = "no";
      cursor_text_color = "background";
      shell_integration = "enabled";
      cursor_trail = 3;
    };
  };
}
