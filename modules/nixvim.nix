{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.nixvim.nixosModules.nixvim
  ];

  programs.nixvim = {
    enable = true;
    options = {
      number = true;
      relativenumber = true;
      shiftwidth = 4;
      autoindent = true;
      smartindent = true;
      clipboard = "unnamedplus";
      signcolumn = "yes";
      tabstop = 4;
      termguicolors = true;
      undofile = true;
      cursorline = true;
      splitbelow = true;
      splitright = true;
    };
    globals.mapleader = " ";
	keymaps = [
	    {
			key = ";f";
			action = "<Cmd>Telescope find_files<CR>";
		}
	];
    colorschemes.gruvbox.enable = true;
    plugins = {
      lualine.enable = true;
      bufferline.enable = true;
	  telescope.enable = true;
	  treesitter.enable = true;
	  luasnip.enable = true;
	  gitsigns.enable = true;
	  nvim-autopairs.enable = true;
    };
    plugins = {
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
		  {name = "luasnip";}
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
