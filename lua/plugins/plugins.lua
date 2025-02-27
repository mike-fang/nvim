return {
    -- Solarized
	{
		'maxmx03/solarized.nvim',
		lazy = false,
		priority = 1000,
		---@type solarized.config
		opts = {},
		config = function(_, opts)
			vim.o.termguicolors = true
			vim.o.background = 'dark'
			require('solarized').setup(opts)
			vim.cmd.colorscheme 'solarized'
		end,
	},
    -- mini.surround
    { 
      "echasnovski/mini.surround",
      opts = {
        mappings = {
          add = "ys", -- Add surrounding in Normal and Visual modes
          delete = "ds", -- Delete surrounding
          find = "gsf", -- Find surrounding (to the right)
          find_left = "gsF", -- Find surrounding (to the left)
          highlight = "gsh", -- Highlight surrounding
          replace = "cs", -- Replace surrounding
          update_n_lines = "gsn", -- Update `n_lines`
        },
      },
     },
     -- Treesitter
     {
         "nvim-treesitter/nvim-treesitter",
         version = false, -- last release is way too old and doesn't work on Windows
         build = ":TSUpdate",
         --event = { "LazyFile", "VeryLazy" },
         lazy = vim.fn.argc(-1) == 0, -- load treesitter early when opening a file from the cmdline
         init = function(plugin)
             -- PERF: add nvim-treesitter queries to the rtp and it's custom query predicates early
             -- This is needed because a bunch of plugins no longer `require("nvim-treesitter")`, which
             -- no longer trigger the **nvim-treesitter** module to be loaded in time.
             -- Luckily, the only things that those plugins need are the custom queries, which we make available
             -- during startup.
             require("lazy.core.loader").add_to_rtp(plugin)
             require("nvim-treesitter.query_predicates")
         end,
         cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
         keys = {
             { "<c-space>", desc = "Increment Selection" },
             { "<bs>", desc = "Decrement Selection", mode = "x" },
         },
         opts_extend = { "ensure_installed" },
         ---@type TSConfig
         ---@diagnostic disable-next-line: missing-fields
         opts = {
             highlight = { enable = true },
             indent = { enable = true },
             ensure_installed = {
                 "bash",
                 "c",
                 "diff",
                 "html",
                 "javascript",
                 "jsdoc",
                 "json",
                 "jsonc",
                 "lua",
                 "luadoc",
                 "luap",
                 "markdown",
                 "markdown_inline",
                 "printf",
                 "python",
                 "query",
                 "regex",
                 "toml",
                 "tsx",
                 "typescript",
                 "vim",
                 "vimdoc",
                 "xml",
                 "yaml",
             },

         },
         ---@param opts TSConfig
         config = function(_, opts)
             if type(opts.ensure_installed) == "table" then
                 opts.ensure_installed = LazyVim.dedup(opts.ensure_installed)
             end
             require("nvim-treesitter.configs").setup(opts)
         end,
     },
     -- mini.pairs
     {
         "echasnovski/mini.pairs",
         --event = "VeryLazy",
         opts = {
             modes = { insert = true, command = true, terminal = false },
             -- skip autopair when next character is one of these
             skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
             -- skip autopair when the cursor is inside these treesitter nodes
             skip_ts = { "string" },
             -- skip autopair when next character is closing pair
             -- and there are more closing pairs than opening pairs
             skip_unbalanced = true,
             -- better deal with markdown code blocks
             markdown = true,
         },
     },
     -- fzf
     {
         "ibhagwan/fzf-lua",
         dependencies = { "echasnovski/mini.icons" },
         opts = {},
     },
     -- undotree
     {
         "mbbill/undotree"
     },
     -- indent guide
     {
         "lukas-reineke/indent-blankline.nvim",
         main = "ibl",
         ---@module "ibl"
         ---@type ibl.config
         opts = {},
     },
     -- LSP
     {
         "williamboman/mason.nvim",
         config = function()
             require("mason").setup()
         end,
     },
     -- copilot
     {
         "zbirenbaum/copilot.lua",
         cmd = "Copilot",
         event = "InsertEnter",
         config = function()
             require("copilot").setup({})
         end,
     },
}
