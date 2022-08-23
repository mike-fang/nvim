print('Sourcing config.lua')

vim.cmd("syntax enable")
vim.opt.hls = true
vim.opt.autoindent = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.backspace = "2"

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Status Line
vim.o.laststatus = 2 -- always show statusbar

statusline ="(%-n)" ..              -- buffer number
            "%f" ..                 -- filename
            "%h%m%r%w" ..           -- status flags
            "%=" ..                 -- right align
            "%-14(%l,%c%V%)" ..     -- line, character
            "%<%P"                  -- file position
vim.o.statusline = statusline

vim.o.number = true -- line numbers
vim.o.background = "dark"
vim.cmd("colorscheme solarized")
vim.api.nvim_set_hl(0, "solarized", {bg=light})
vim.o.guifont = "Inconsolata:h14"
vim.o.fillchars= "fold:-"
