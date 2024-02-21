-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Only required if you have packer configured as `opt`
return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    --use 'ervandew/supertab'
    use 'altercation/vim-colors-solarized'
    --use 'Raimondi/delimitMate'
    use 'tpope/vim-surround'
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

	use 'junegunn/fzf'
	use 'junegunn/fzf.vim'
--    use 'mbbill/undotree'
    use 'simnalamburt/vim-mundo'
    use {
      'nvim-telescope/telescope.nvim', tag = '0.1.5',
      requires = { {'nvim-lua/plenary.nvim'} },
      config = [[require('config.telescope')]]
    }
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

	use {
	  'VonHeikemen/lsp-zero.nvim',
	  requires = {
		-- LSP Support
		{'williamboman/mason.nvim'},
		{"williamboman/mason-lspconfig.nvim"},
		{'neovim/nvim-lspconfig'},

		-- Autocompletion
		{'hrsh7th/nvim-cmp'},
		{'hrsh7th/cmp-buffer'},
		{'hrsh7th/cmp-path'},
		{'saadparwaiz1/cmp_luasnip'},
		{'hrsh7th/cmp-nvim-lsp'},
		{'hrsh7th/cmp-nvim-lua'},

		-- Snippets
		{'L3MON4D3/LuaSnip'},
		{'rafamadriz/friendly-snippets'},
	  },
      config = [[require("config.lsp")]]
	}
    use 'junegunn/vim-peekaboo'
    use "lukas-reineke/indent-blankline.nvim"
end)

