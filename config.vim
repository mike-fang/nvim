if echo_source
    echo "Sourcing config..."
endif
set number		"Line numbers
syntax enable
set background=dark
colorscheme solarized
set guifont=Inconsolata:h14	"Set font
set fillchars=fold:-
set hls
set autoindent
set ignorecase
set smartcase
set autoread
let g:netrw_liststyle=3

" No swap, presistent undo
set noswapfile
set undofile
set undodir=~/.vim/undo

filetype plugin on

" Interactive subsitute
if has('nvim')
	set inccommand=split
endif

" :term start in insert mode
autocmd TermOpen * startinsert

" tabs
set backspace=2
set tabstop=4
set shiftwidth=4
set expandtab

"split
set splitright
set splitbelow

autocmd BufEnter,InsertLeave * :syntax sync fromstart

" Status Line {  
        set laststatus=2                             " always show statusbar  
        set statusline=  
        set statusline+=[%-n]\                     " buffer number  
        set statusline+=%f\                          " filename   
        set statusline+=%h%m%r%w                     " status flags  
        "set statusline+=\[%{strlen(&ft)?&ft:'none'}] " file type  
        set statusline+=%=                           " right align remainder  
        "set statusline+=0x%-8B                       " character value  
        set statusline+=%-14(%l,%c%V%)               " line, character  
        set statusline+=%<%P                         " file position  
"}
"
" Use treesitter folding
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

" Force htmldjango
au BufNewFile,BufRead *.html set ft=htmldjango

" Keep 3 lines below and above cursor
set scrolloff=3

" Copy to clipboard
set clipboard=unnamed

