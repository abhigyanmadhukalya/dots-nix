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
      opts = {
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
            formatters_by_ft = {
              lua = ["stylua"];
              python = ["isort" "black"];
              nix = ["alejandra"];
              "_" = ["trim_whitespace"];
            };
          };
        };
        lsp = {
          enable = true;
          servers = {
            lua_ls.enable = true;
            nixd.enable = true;
            pyright.enable = true;
          };
        };
        cmp-nvim-lsp.enable = true;
        cmp-emoji.enable = true;
        cmp-buffer.enable = true;
        cmp-path.enable = true;
        cmp_luasnip.enable = true;
        cmp-cmdline.enable = true;
        cmp = {
          enable = true;
          cmdline = {
            "/" = {
              mapping.__raw = "cmp.mapping.preset.cmdline()";
              sources = [{name = "buffer";}];
            };
            ":" = {
              mapping.__raw = "cmp.mapping.preset.cmdline()";
              sources = [
                {name = "path";}
                {
                  name = "cmdline";
                  option.ignore_cmds = [
                    "Man"
                    "!"
                  ];
                }
              ];
            };
          };

          filetype = {
            sql.sources = [
              {name = "buffer";}
              {name = "vim-dadbod-completion";}
            ];
          };

          settings = {
            # Preselect first entry
            completion.completeopt = "menu,menuone,noinsert";
            sources = [
              {name = "nvim_lsp";} # lsp
              {name = "luasnip";}
              # { name = "copilot"; }
              {
                name = "buffer";
                # Words from other open buffers can also be suggested.
                option.get_bufnrs.__raw = "vim.api.nvim_list_bufs";
                keywordLength = 3;
              }
              {name = "path";}
            ];

            window = {
              completion.border = "rounded";
              documentation.border = "rounded";
            };
            experimental.ghost_text = true;

            mapping = {
              "<Tab>".__raw = ''
                cmp.mapping(function(fallback)
                  local luasnip = require("luasnip")
                  if luasnip.locally_jumpable(1) then
                    luasnip.jump(1)
                  else
                    fallback()
                  end
                end, { "i", "s" })
              '';

              "<S-Tab>".__raw = ''
                cmp.mapping(function(fallback)
                  local luasnip = require("luasnip")
                  if luasnip.jumpable(-1) then
                    luasnip.jump(-1)
                  else
                    fallback()
                  end
                end, { "i", "s" })
              '';

              "<c-n>" = "cmp.mapping(cmp.mapping.select_next_item())";
              "<c-p>" = "cmp.mapping(cmp.mapping.select_prev_item())";
              "<c-e>" = "cmp.mapping.abort()";
              "<C-d>" = "cmp.mapping.scroll_docs(-4)";
              "<C-f>" = "cmp.mapping.scroll_docs(4)";
              "<Up>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
              "<Down>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
              "<CR>" = "cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true })";
              "<C-Space>" = "cmp.mapping.complete()";
            };

            snippet.expand = ''
              function(args)
                require('luasnip').lsp_expand(args.body)
              end
            '';
          };
        };
      };
    };
  };
}
