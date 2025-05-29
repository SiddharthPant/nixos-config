{pkgs, ...}: {
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home = {
    username = "sid";
    homeDirectory = "/home/sid";

    # This value determines the Home Manager release that your configuration is
    # compatible with. This helps avoid breakage when a new Home Manager release
    # introduces backwards incompatible changes.
    #
    # You should not change this value, even if you update Home Manager. If you do
    # want to update the value, then make sure to first check the Home Manager
    # release notes.
    stateVersion = "25.05"; # Please read the comment before changing.

    # The home.packages option allows you to install Nix packages into your
    # environment.
    packages = [
      # # Adds the 'hello' command to your environment. It prints a friendly
      # # "Hello, world!" when run.
      pkgs.hello

      # # It is sometimes useful to fine-tune packages, for example, by applying
      # # overrides. You can do that directly here, just don't forget the
      # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
      # # fonts?
      # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

      # # You can also create simple shell scripts directly inside your
      # # configuration. For example, this adds a command 'my-hello' to your
      # # environment:
      # (pkgs.writeShellScriptBin "my-hello" ''
      #   echo "Hello, ${config.home.username}!"
      # '')
    ];

    # Home Manager is pretty good at managing dotfiles. The primary way to manage
    # plain files is through 'home.file'.
    file = {
      # # Building this configuration will create a copy of 'dotfiles/screenrc' in
      # # the Nix store. Activating the configuration will then make '~/.screenrc' a
      # # symlink to the Nix store copy.
      # ".screenrc".source = dotfiles/screenrc;

      # # You can also set the file content immediately.
      # ".gradle/gradle.properties".text = ''
      #   org.gradle.console=verbose
      #   org.gradle.daemon.idletimeout=3600000
      # '';
    };

    # Home Manager can also manage your environment variables through
    # 'home.sessionVariables'. These will be explicitly sourced when using a
    # shell provided by Home Manager. If you don't want to manage your shell
    # through Home Manager then you have to manually source 'hm-session-vars.sh'
    # located at either
    #
    #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
    #
    # or
    #
    #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
    #
    # or
    #
    #  /etc/profiles/per-user/sid/etc/profile.d/hm-session-vars.sh
    #
    sessionVariables = {
      EDITOR = "nvim";
      BROWSER = "google-chrome-stable";
      TERMINAL = "kitty";
    };
  };
  programs = {
    # Let Home Manager install and manage itself.
    home-manager.enable = true;

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

    git = {
      enable = true;
      extraConfig = {
        init.defaultBranch = "main";
        push.autoSetupRemote = true;
      };
    };

    zoxide = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;

      options = ["--cmd cd"];
    };

    fzf = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
      tmux.enableShellIntegration = true;

      defaultCommand = "rg --files --ignore-vcs --hidden";
    };

    kitty = {
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

    nvf = {
      enable = true;

      settings = {
        vim = {
          viAlias = false;
          vimAlias = true;
          theme = {
            enable = true;
            name = "catppuccin";
            style = "mocha";
            transparent = false;
          };

          statusline = {
            lualine = {
              enable = true;
              theme = "catppuccin";
            };
          };

          tabline.nvimBufferline.enable = true;
          autopairs.nvim-autopairs.enable = true;
          treesitter.context.enable = true;
          telescope.enable = true;
          autocomplete.blink-cmp.enable = true;
          terminal = {
            toggleterm = {
              enable = true;
              lazygit.enable = true;
            };
          };
          utility = {
            diffview-nvim.enable = true;
            icon-picker.enable = true;
            surround.enable = true;
            multicursors.enable = true;
            motion = {
              hop.enable = true;
              leap.enable = true;
              precognition.enable = true;
            };
            images.img-clip.enable = true;

            sleuth.enable = true;
            oil-nvim.enable = true;
          };

          notes = {
            mind-nvim.enable = true;
            todo-comments.enable = true;
          };

          ui = {
            borders.enable = true;
            noice.enable = true;
            colorizer.enable = true;
            illuminate.enable = true;
            breadcrumbs = {
              enable = true;
              navbuddy.enable = true;
            };
            smartcolumn = {
              enable = true;
              setupOpts.custom_colorcolumn = {
                nix = "110";
                ruby = "120";
                java = "130";
                go = ["90" "130"];
              };
            };
            fastaction.enable = true;
          };

          snippets.luasnip.enable = true;
          comments.comment-nvim.enable = true;

          binds = {
            whichKey.enable = true;
            cheatsheet.enable = true;
            hardtime-nvim.enable = true;
          };

          git = {
            enable = true;
            gitsigns.enable = true;
            gitsigns.codeActions.enable = false; # throws an annoying debug message
          };

          minimap.codewindow.enable = true;
          dashboard.alpha.enable = true;
          notify.nvim-notify.enable = true;

          projects.project-nvim.enable = true;

          lsp = {
            enable = true;

            formatOnSave = true;
            lspkind.enable = false;
            lightbulb.enable = true;
            lspsaga.enable = false;
            trouble.enable = true;
            lspSignature.enable = false;
            otter-nvim.enable = true;
            nvim-docs-view.enable = true;
          };

          languages = {
            enableFormat = true;
            enableTreesitter = true;
            enableExtraDiagnostics = true;

            nix.enable = true;
            markdown.enable = true;
            bash.enable = true;
            css.enable = true;
            html.enable = true;
            ts.enable = true;
            go.enable = true;
            lua.enable = true;
            python.enable = true;
            rust = {
              enable = true;
              crates.enable = true;
            };
            tailwind.enable = true;
          };

          visuals = {
            nvim-scrollbar.enable = true;
            nvim-web-devicons.enable = true;
            nvim-cursorline.enable = true;
            cinnamon-nvim.enable = true;
            fidget-nvim.enable = true;

            highlight-undo.enable = true;
            indent-blankline.enable = true;
          };
        };
      };
    };
  };

  # Dconf settings (Gnome preferences)
  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/privacy" = {
        report-technical-problems = false;
      };

      "org/gnome/desktop/wm/preferences" = {
        button-layout = "appmenu:minimize,maximize,close";
      };

      "org/gnome/shell" = {
        disable-user-extensions = false;
        enabled-extensions = with pkgs.gnomeExtensions; [
          appindicator.extensionUuid
          net-speed-simplified.extensionUuid
          caffeine.extensionUuid
          sound-output-device-chooser.extensionUuid
          clipboard-indicator.extensionUuid
        ];

        favorite-apps = [
          "google-chrome.desktop"
          "kitty.desktop"
          "org.gnome.Nautilus.desktop"
          "org.gnome.Settings.desktop"
          "org.gnome.Calculator.desktop"
        ];
      };
    };
  };
}
