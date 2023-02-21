vim.keymap.set('n', '<Leader>ll', '<Cmd>wa<cr>:tabe term://python3 %<cr><C-\\><C-N>G')
vim.keymap.set('n', '<Leader>rr', vim.lsp.buf.rename, {})
