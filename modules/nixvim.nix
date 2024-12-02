{inputs, ...}: let
  options = {
    silent = true;
    noremap = true;
  };
in {
  imports = [
    inputs.nixvim.nixosModules.nixvim
  ];

  programs.nixvim = {
    config = {
      enable = true;
      options = {
        number = true;
        relativenumber = true;
        signcolumn = "yes";
        shiftwidth = 4;
        autoindent = true;
        smartindent = true;
        clipboard = "unnamedplus";
        tabstop = 4;
        termguicolors = true;
        cursorline = true;
        splitbelow = true;
        splitright = true;
        undofile = true;
      };
      globals.mapleader = " ";
      colorschemes.gruvbox.enable = true;
      keymaps = [
        {
          key = "ss";
          action = "<Cmd>split<CR>";
          inherit options;
        }
        {
          key = "sv";
          action = "<Cmd>vsplit<CR>";
          inherit options;
        }
        {
          key = "+";
          action = "<C-a>";
          inherit options;
        }
        {
          key = "-";
          action = "<C-x>";
          inherit options;
        }
        {
          key = "sh";
          action = "<C-w>h";
          inherit options;
        }
        {
          key = "sj";
          action = "<C-w>j";
          inherit options;
        }
        {
          key = "sk";
          action = "<C-w>k";
          inherit options;
        }
        {
          key = "sl";
          action = "<C-w>l";
          inherit options;
        }
        {
          key = "<C-j>";
          action = ''
            function()
                vim.diagnostic.goto_next()
            end
          '';
          inherit options;
        }
        {
          key = "K";
          action = "<Cmd>Lspsaga hover_doc<CR>";
          inherit options;
        }
        {
          key = "sf";
          action = "<Cmd>Telescope find_files<CR>";
          inherit options;
        }
        {
          key = "<C-n>";
          action = "<Cmd>Neotree toggle<CR>";
          inherit options;
        }
      ];

      plugins = {
        lualine.enable = true;
        bufferline.enable = true;
        lspsaga.enable = true;
        treesitter.enable = true;
        telescope.enable = true;
        luasnip.enable = true;
        nvim-autopairs.enable = true;
        gitsigns.enable = true;
        fidget.enable = true;
        indent-blankline.enable = true;
        neo-tree.enable = true;
        which-key.enable = true;
        conform-nvim = {
          enable = true;
          settings = {
            format_on_save = ''
              function(bufnr)
                -- Disable "format_on_save lsp_fallback" for lanuages that don't
                -- have a well standardized coding style. You can add additional
                -- lanuages here or re-enable it for the disabled ones.
                local disable_filetypes = { c = true, cpp = true }
                return {
                  timeout_ms = 500,
                  lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype]
                }
              end
            '';
          };
          formattersByFt = {
            lua = ["stylua"];
            python = ["isort" "black"];
            nix = ["alejandra"];
            "_" = ["trim_whitespace"];
          };
        };
        lsp = {
          enable = true;
          servers = {
            lua-ls.enable = true;
            nixd.enable = true;
            pyright.enable = true;
          };
        };
        cmp = {
          enable = true;
          autoEnableSources = true;
          settings.sources = [
            {name = "nvim_lsp";}
            {name = "path";}
            {name = "buffer";}
          ];
        };
      };
    };
  };
}
