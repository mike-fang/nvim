vim.api.nvim_buf_set_keymap(0, "n", "<Leader>ll", ':wa<CR>:TermExec cmd="python ' .. vim.fn.expand('%:p') ..'"<CR>', { noremap = true, silent = true })

