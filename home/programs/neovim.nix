_: {
  programs.nvf = {
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
        filetree.neo-tree.enable = true;
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
          motion.precognition.enable = true;
          images.img-clip.enable = true;
          sleuth.enable = true;
          oil-nvim = {
            enable = true;
            setupOpts = {
              # Oil will take over directory buffers (e.g. `vim .` or `:e src/`)
              # Set to false if you still want to use netrw.
              default_file_explorer = true;
              columns = [
                "icon"
                "permissions"
                "size"
                "mtime"
              ];
            };
          };
        };

        # The keymap needs to be configured separately
        keymaps = [
          {
            mode = "n";
            key = "-";
            action = "<CMD>Oil<CR>";
            desc = "Open parent directory";
          }
        ];

        notes = {
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
}
