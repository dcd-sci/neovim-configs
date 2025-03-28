call plug#begin('~/.vim/plugged')
Plug 'folke/tokyonight.nvim'
call plug#end()

lua << EOF
require'lspconfig'.pylsp.setup{}
EOF

colorscheme tokyonight

set number

set incsearch
set ignorecase

set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

set clipboard+=unnamedplus

