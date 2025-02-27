-- If you used `let echo_source = 1` in your init, replicate that here
if vim.g.echo_source == 1 then
  print("Sourcing config...")
end

-- Basic settings
vim.opt.number = true       -- line numbers
vim.cmd("syntax enable")    -- equivalent to `syntax enable`
vim.opt.background = "dark"
vim.cmd("colorscheme solarized")  -- set colorscheme

vim.opt.guifont = "Inconsolata:h14"
vim.opt.fillchars = { fold = "-" }  -- fill character for folding
vim.opt.hlsearch = true
vim.opt.autoindent = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.autoread = true

-- Python venv
vim.g.python3_host_prog = vim.fn.expand("$HOME/.config/nvim/.venv/bin/python3")

-- netrw
vim.g.netrw_liststyle = 3

-- No swap, enable persistent undo
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.undodir = "~/.vim/undo"

-- filetype plugin on
vim.cmd("filetype plugin on")

-- Interactive substitute for Neovim
if vim.fn.has("nvim") == 1 then
  vim.opt.inccommand = "split"
end

-- Start in insert mode for new terminals
vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*",
  command = "startinsert"
})

-- Tabs
-- Equivalent to `set backspace=2`, but more explicit
vim.opt.backspace = { "indent", "eol", "start" }
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Split behavior
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sync syntax on certain events
vim.api.nvim_create_autocmd({ "BufEnter", "InsertLeave" }, {
  pattern = "*",
  command = "syntax sync fromstart"
})

-- Status line
vim.opt.laststatus = 2
vim.opt.statusline = "[%-n]\\ %f %h%m%r%w%=%-14(%l,%c%V%)%<%P"

-- Use treesitter folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

-- Force htmldjango for .html
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*.html",
  command = "set ft=htmldjango"
})

-- Keep 3 lines below and above cursor
vim.opt.scrolloff = 3

-- Copy to clipboard
-- vim.opt.clipboard = "unnamed"
