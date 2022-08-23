let echo_source = 0
set nocompatible

" Python source venv
let g:python3_host_prog = expand('$HOME/.config/nvim/.venv/bin/python3')

lua <<EOF
require('plugins')

--require('mason').setup()
--require('mason-lspconfig').setup()

EOF

source ~/.config/nvim/maps.vim
source ~/.config/nvim/config.vim
source ~/.config/nvim/functions.vim


augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end



