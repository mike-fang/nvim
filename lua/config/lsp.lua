local vim = vim
local lsp = require('lsp-zero')
local luasnip = require('luasnip')

lsp.preset('recommended')
lsp.setup()

local cmp = require('cmp')

cmp.setup {
	mapping = cmp.mapping.preset.insert({
        ['<CR>'] = function(fallback)
            if cmp.visible() then
                cmp.abort()
                vim.api.nvim_input("<CR>")
            else
                fallback()
            end
        end,
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

luasnip.filetype_extend("htmldjango", {"djangohtml", "html"})
