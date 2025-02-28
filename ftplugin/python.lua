vim.api.nvim_buf_set_keymap(0, "n", "<Leader>ll", ":wa<CR>:tabe<CR>:terminal<CR>python3 " .. vim.fn.expand("%:p"), { noremap = true, silent = true })
