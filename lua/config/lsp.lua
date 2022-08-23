local vim = vim
local lsp = require('lsp-zero')
lsp.preset('recommended')
lsp.setup()

local cmp = require('cmp')
local luasnip = require("luasnip")

cmp.setup {
	mapping = cmp.mapping.preset.insert({
        ['<CR>'] = cmp.mapping.abort(),
		['<C-n>'] = cmp.mapping.select_next_item(),
		['<C-p>'] = cmp.mapping.select_prev_item(),
		['<Tab>'] = cmp.mapping.confirm(),
	}),
}

vim.diagnostic.config({
    virtual_text = false
})

-- show on hover window
vim.opt.updatetime = 750
vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float({border="none"}, {focus=false})]]
