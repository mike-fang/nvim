if vim.g.echo_source == 1 then
  print("Sourcing maps...")
end

-- Leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Short alias for readability
local keymap = vim.keymap.set


-- LSP
keymap('n', '<Leader>rn', vim.lsp.buf.rename)
keymap("n", "K", vim.lsp.buf.hover)

-- Undotree
keymap("n", "<leader>ud", ":UndotreeToggle<CR>")

-- Telescope
--keymap('n', '<leader>FF', ":lua require('fzf-lua').files({cwd = vim.fn.expand('%:p:h')})<CR>", { noremap = true, silent = true })
--keymap("n", "<leader>ff", ":FzfLua files<CR>")
--keymap("n", "<leader>fg", ":FzfLua live_grep<CR>")

-- Edit config files
keymap("n", "<leader>eb", ":tab drop " .. vim.g.userpath_plugins .. "<CR>")
keymap("n", "<leader>ec", ":tab drop " .. vim.g.userpath_config .. "<CR>")
keymap("n", "<leader>em", ":tab drop " .. vim.g.userpath_maps .. "<CR>")
keymap("n", "<leader>en", ":tab drop ~/.config/nvim/functions.lua<CR>")
keymap("n", "<leader>ev", ":tab drop ~/.config/nvim/init.lua<CR>")

-- Execute with dynamic filetype
keymap("n", "<leader>ef", "<cmd>execute ':tab drop ~/.config/nvim/ftplugin/' . &filetype . '.lua'<CR>")

-- Open/create misc files
keymap("n", "<leader>et", ":vsplit TODO<CR>")
keymap("n", "<leader>ep", ":vsplit .scratch_pad.py<CR>")

-- Source vimrc
--keymap("n", "<leader>sv", ":luafile ~/.config/nvim/init.lua<CR>:luafile ~/.config/nvim/maps.lua<CR>:luafile ~/.config/nvim/config.lua<CR>")
keymap("n", "<leader>sv", function() reload_config() end)
keymap("n", "<leader>sb", ":luafile ~/.config/nvim/lua/plugins/plugins.lua<CR>:Lazy sync<CR>")

-- Window splits
keymap("n", "<leader>ts", ":tab split<CR>")
keymap("n", "<leader>vs", ":vsplit<CR>")
keymap("n", "<leader>hs", ":split<CR>")

-- Close window
keymap("n", "<leader>w", ":q<CR>")

-- Open file in new split (parent dir)
keymap("n", "<leader>ee", ":vs %:h<CR>")

-- macOS open
keymap("n", "<leader>oo", ":wa<CR>:tabe term://open %<CR>")

-- Toggle fold
keymap("n", "<leader><space>", "za")

-- Session save/restore
keymap("n", "<leader>ss", ":mksession! ~/temp_vim_session.vim<CR>")
keymap("n", "<leader>sr", ":source ~/temp_vim_session.vim<CR>")

-- Yank to clipboard
keymap("v", "Y", '"+y')


-- Selected paste
keymap("n", "gp", "'[V']")

-- Terminal
keymap("n", "<leader>tt", ":ToggleTerm<CR>")
keymap("n", "<C-t>", ":ToggleTerm<CR>")
-- Use a terminal-mode mapping for Esc:
keymap("t", "<Esc>", [[<C-\><C-n>]])

-- LuaSnip
-- [[
-- keymap("i", "<Tab>", function()
--   return require("luasnip").expand_or_jumpable() 
--          and "<Plug>luasnip-expand-or-jump>"
--          or "<Tab>"
-- end, {expr = true, silent = true})
-- 
-- keymap("i", "<S-Tab>", "<cmd>lua require('luasnip').jump(-1)<CR>", {silent = true})
-- keymap("s", "<Tab>", "<cmd>lua require('luasnip').jump(1)<CR>", {silent = true})
-- keymap("s", "<S-Tab>", "<cmd>lua require('luasnip').jump(-1)<CR>", {silent = true})
-- ]]
