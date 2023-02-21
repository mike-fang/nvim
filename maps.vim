if echo_source
	echo "Sourcing maps..."
endif
let mapleader=" "
let localmapleader=" "

" Undotree
nnoremap <leader>ud :MundoToggle<CR>

" Find files
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>

" Edit config files
nnoremap <leader>eb :tabe ~/.config/nvim/lua/plugins.lua<cr>
nnoremap <leader>ec :tabe ~/.config/nvim/config.vim<cr>
nnoremap <leader>em :tabe ~/.config/nvim/maps.vim<cr>
nnoremap <leader>en :tabe ~/.config/nvim/functions.vim<cr>
nnoremap <leader>ev :tabe ~/.config/nvim/init.vim<cr>
nnoremap <leader>el :tabe ~/.config/nvim/lua/<cr>
nnoremap <leader>ef :execute ":e ~/.config/nvim/ftplugin/" . &filetype . ".lua" <cr>

" Open/create misc files
nnoremap <leader>et :vsplit TODO<cr>
nnoremap <leader>ep :vsplit scratch_pad.py<cr>

" Source vimrc
nnoremap <leader>sv :source ~/.config/nvim/init.vim<cr>
nnoremap <leader>sb :PackerSync<cr>

"nnoremap <leader>w <C-w>q
nnoremap <leader>vs :vsplit <cr>
nnoremap <leader>hs :split <cr>

" Open file in new window
"nnoremap <leader>f <C-w><C-f>
nnoremap <leader>ee :vs %:h<cr>
nnoremap <leader>w :q<cr>

" Open file in OSX
nnoremap <leader>oo :wa<cr>:tabe term://open %<cr>
" Toggle fold
nnoremap <leader><space> za

"nnoremap <leader>mm :wa<cr> :make<cr>
"nnoremap <leader>q :bo copen<cr>

" Save and restore session
nnoremap <leader>ss :mksession! ~/temp_vim_session.vim<cr>
nnoremap <leader>sr :source ~/temp_vim_session.vim<cr>

" Selected pasted
nnoremap gp '[V']

" FZF mappings
noremap <leader>a :exe ':Ag ' . expand('<cword>')<CR>
noremap <leader>hh :History<cr>

" Term mode mapping
nnoremap <leader>t :vsplit term://zsh<cr>
nnoremap <Esc> <C-\><C-n>

" luasnip
imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 
" -1 for jumping backwards.
inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>

snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>

