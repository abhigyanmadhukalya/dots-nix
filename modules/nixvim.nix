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
        options = options;
      }
      {
        key = "sv";
        action = "<Cmd>vsplit<CR>";
        options = options;
      }
      {
        key = "+";
        action = "<C-a>";
        options = options;
      }
      {
        key = "-";
        action = "<C-x>";
        options = options;
      }
      {
        key = "sh";
        action = "<C-w>h";
        options = options;
      }
      {
        key = "sj";
        action = "<C-w>j";
        options = options;
      }
      {
        key = "sk";
        action = "<C-w>k";
        options = options;
      }
      {
        key = "sl";
        action = "<C-w>l";
        options = options;
      }
      {
        key = "<C-j>";
        action = ''
          function()
              vim.diagnostic.goto_next()
          end
        '';
        options = options;
      }
      {
        key = "K";
        action = "<Cmd>Lspsaga hover_doc<CR>";
        options = options;
      }
      {
        key = "sf";
        action = "<Cmd>Telescope find_files<CR>";
        options = options;
      }
      {
        key = "<C-n>";
        action = "<Cmd>Neotree toggle<CR>";
        options = options;
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
        formatOnSave = {
          lspFallback = true;
          timeoutMs = 300;
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
      nvim-cmp = {
        enable = true;
        autoEnableSources = true;
        sources = [
          {name = "nvim_lsp";}
          {name = "path";}
          {name = "buffer";}
        ];
        mapping = {
          "<CR>" = "cmp.mapping.confirm({ select = true })";
          "<Tab>" = {
            action = ''
              function(fallback)
                          if cmp.visible() then
                            cmp.select_next_item()
                          elseif luasnip.expandable() then
                            luasnip.expand()
                          elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                          elseif check_backspace() then
                            fallback()
                          else
                            fallback()
                          end
                        end
            '';
            modes = ["i" "s"];
          };
        };
      };
    };
  };
}
