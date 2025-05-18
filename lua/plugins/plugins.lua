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
    --{ "ellisonleao/gruvbox.nvim", priority = 1000 , config = true, opts = ...},
    -- mini.surround
    { 
        "echasnovski/mini.surround",
        opts = {
            mappings = {
                add = "Sa", -- Add surrounding in Normal and Visual modes
                delete = "Sr", -- Delete surrounding
                find = "gsf", -- Find surrounding (to the right)
                find_left = "gsF", -- Find surrounding (to the left)
                highlight = "gsh", -- Highlight surrounding
                replace = "Sc", -- Replace surrounding
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
            require("nvim-treesitter.configs").setup(opts)
        end,
    },
    -- mini.pairs
    {
        "echasnovski/mini.pairs",
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
    -- Snacks
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        ---@type snacks.Config
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
            bigfile = { enabled = true },
            explorer = {
                enabled = true,
                replace_netrw = true,
            },
            indent = { enabled = true },
            picker = { enabled = true },
            quickfile = { enabled = true },
            scope = { enabled = true },
        },
        keys = {
            -- Picker
            { "<leader>fs", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
            { "<leader>fg", function() Snacks.picker.grep() end, desc = "Grep" },
            { "<leader>ee", function() Snacks.explorer() end, desc = "File Explorer" },
            { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
            { "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files" },
            { "<leader>ud", function() Snacks.picker.undo() end, desc = "Undo History" },   
            -- LSP
            { "gD", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
            { "gd", function() Snacks.picker.lsp_declarations() end, desc = "Goto Declaration" },
            { "gr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
            { "gI", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
            { "gy", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },

        }
    },
    -- LSP
 --   {
 --       {
 --           "neovim/nvim-lspconfig",
 --           config = function()
 --               local lspconfig = require("lspconfig")

 --               -- Standard on_attach function for keymaps, etc.
 --               local on_attach = function(client, bufnr)
 --                   local opts = { buffer = bufnr, noremap = true, silent = true }
 --                   vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
 --                   -- Add more keymaps or config here if desired
 --               end

 --               -- Setup for Python LSP
 --               lspconfig.pyright.setup({
 --                   on_attach = on_attach,
 --                   -- You can add extra `settings = { ... }` if needed
 --               })

 --               -- Setup for Rust (your existing config)
 --               lspconfig.rust_analyzer.setup({
 --                   on_attach = on_attach,
 --               })
 --           end,
 --       },
 --   },
    -- Mason
    {
        "mason-org/mason.nvim",
        dependencies = {
            "mason-org/mason-lspconfig.nvim",
            "neovim/nvim-lspconfig",
        },
        config = function()
            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = { "pyright", "rust_analyzer", "lua_ls" },
            })
        end,
    },
 --   {
 --       "williamboman/mason.nvim",
 --       config = true,
 --   },
 --   {
 --       "williamboman/mason-lspconfig.nvim",
 --       dependencies = { "neovim/nvim-lspconfig" },
 --       config = function()
 --           require("mason-lspconfig").setup {
 --               -- Ensure certain servers are always installed
 --               ensure_installed = { "pyright", "rust_analyzer", "lua_ls" },
 --           }

 --           -- "handlers" gets called for *every* installed server
 --           require("mason-lspconfig").setup_handlers {
 --               -- 1. Default handler
 --               function(server_name)
 --                   require("lspconfig")[server_name].setup({
 --                       on_attach = function(client, bufnr)
 --                           -- Your on_attach code, e.g. keymaps
 --                           local opts = { buffer = bufnr, noremap = true, silent = true }
 --                           vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
 --                           -- etc.
 --                       end,
 --                   })
 --               end,

 --               -- 2. Optionally override certain servers
 --               ["lua_ls"] = function()
 --                   require("lspconfig").lua_ls.setup {
 --                       on_attach = function(client, bufnr)
 --                           local opts = { buffer = bufnr, noremap = true, silent = true }
 --                           vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
 --                       end,
 --                       settings = {
 --                           Lua = {
 --                               diagnostics = { globals = { "vim" } },
 --                           },
 --                       },
 --                   }
 --               end,
 --           }
 --       end,
 --   },
    --copilot
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
            require("copilot").setup({
                suggestion = {
                    enabled = true,
                },
            })
        end,
    },
    {
        "zbirenbaum/copilot-cmp",
        config = function ()
            require("copilot_cmp").setup()
        end
    },
    --completion
    {
        {
            "hrsh7th/nvim-cmp",
            event = "InsertEnter",
            dependencies = {
                "hrsh7th/cmp-nvim-lsp",
                "hrsh7th/cmp-buffer",
                "hrsh7th/cmp-path",
                -- Make sure copilot-cmp is listed as a dependency if not globally loaded
                "zbirenbaum/copilot-cmp",
            },
            config = function()
                local cmp = require("cmp")

                cmp.setup({
                    snippet = {
                        expand = function(args)
                            -- If you're using LuaSnip or another snippet engine
                            --require("luasnip").lsp_expand(args.body)
                        end,
                    },
                    mapping = {
                        ["<C-j>"] = cmp.mapping(function(fallback)
                            if cmp.visible() then
                                cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
                            else
                                fallback()
                            end
                        end, { "i", "s" }),  -- i=insert mode, s=select mode

                        ["<C-k>"] = cmp.mapping(function(fallback)
                            if cmp.visible() then
                                cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
                            else
                                fallback()
                            end
                        end, { "i", "s" }),
                        ["<tab>"] = cmp.mapping.confirm({ select = true }),  -- Accept completion
                        -- Other mappings...
                    },
                    sources = cmp.config.sources({
                        -- Copilot source first if you want Copilot suggestions on top
                        { name = "copilot" },
                        { name = "nvim_lsp" },
                        { name = "buffer" },
                        { name = "path" },
                    })
                })

                -- Initialize copilot-cmp (only needed if you didn't do it in its own config)
                --require("copilot_cmp").setup()
            end,
        },
        {
            --"L3MON4D3/LuaSnip",
            -- ... snippet config ...
        },
    },
    -- copilot chat
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        -- branch = "main",
        --cmd = "CopilotChat",
        opts = function()
            local user = vim.env.USER or "User"
            user = user:sub(1, 1):upper() .. user:sub(2)
            return {
                auto_insert_mode = true,
                question_header = "  " .. user .. " ",
                answer_header = "  Copilot ",
                window = {
                    width = 0.4,
                },
            }
        end,
        keys = {
            { "<c-CR>", "<CR>", ft = "copilot-chat", desc = "Submit Prompt", remap = true },
            { "<leader>a", "", desc = "+ai", mode = { "n", "v" } },
            {
                "<leader>aa",
                function()
                    return require("CopilotChat").toggle()
                end,
                desc = "Toggle (CopilotChat)",
                mode = { "n", "v" },
            },
            {
                "<leader>ax",
                function()
                    return require("CopilotChat").reset()
                end,
                desc = "Clear (CopilotChat)",
                mode = { "n", "v" },
            },
            {
                "<leader>aq",
                function()
                    local input = vim.fn.input("Quick Chat: ")
                    if input ~= "" then
                        require("CopilotChat").ask(input)
                    end
                end,
                desc = "Quick Chat (CopilotChat)",
                mode = { "n", "v" },
            },
        },
        config = function(_, opts)
            local chat = require("CopilotChat")

            vim.api.nvim_create_autocmd("BufEnter", {
                pattern = "copilot-chat",
                callback = function()
                    vim.opt_local.relativenumber = false
                    vim.opt_local.number = false
                end,
            })

            chat.setup(opts)
        end,
    },
    -- misc
    { 'echasnovski/mini.icons', version = false },
    { "nvim-lua/plenary.nvim", lazy = true },
    {
        "echasnovski/mini.icons",
        lazy = true,
        opts = {
            file = {
                [".keep"] = { glyph = "󰊢", hl = "MiniIconsGrey" },
                ["devcontainer.json"] = { glyph = "", hl = "MiniIconsAzure" },
            },
            filetype = {
                dotenv = { glyph = "", hl = "MiniIconsYellow" },
            },
        },
        init = function()
            package.preload["nvim-web-devicons"] = function()
                require("mini.icons").mock_nvim_web_devicons()
                return package.loaded["nvim-web-devicons"]
            end
        end,
    },
    -- file exploer
    {
        "echasnovski/mini.files",
        opts = {
            windows = {
                preview = true,
                --width_focus = 30,
                --width_preview = 60,
            },
            options = {
                use_as_default_explorer = true,
            },
        },
        keys = {
            {
                "<leader>fm",
                function()
                    require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
                end,
                desc = "Open mini.files (Directory of Current File)",
            },
            {
                "<leader>fM",
                function()
                    require("mini.files").open(vim.uv.cwd(), true)
                end,
                desc = "Open mini.files (cwd)",
            },
            {
                "<esc>",
                function()
                    require("mini.files").close()
                end,
                desc = "Close mini.file",
            },
        },
    },
    -- toggleterm
    {
        'akinsho/toggleterm.nvim',
        version = "*",
        opts = {--[[ things you want to change go here]]},
    }
}
