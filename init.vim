let g:plug_url_format = 'git@github.com:%s.git'

call plug#begin('~/.vim/plugged')
Plug 'folke/tokyonight.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
call plug#end()

colorscheme tokyonight

set number
set incsearch
set ignorecase
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set clipboard+=unnamedplus

lua << EOF
-- Configuração do nvim-cmp(autocomplete)
local cmp = require'cmp'
cmp.setup({
    snippet = {
        expand = function(args)
            require'luasnip'.lsp_expand(args.body)
        end,
    },
    mapping = {
        ['<Tab>'] = cmp.mapping.select_next_item(),
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'buffer' }, 
        { name = 'path' },
    })
})

-- Configuração do LSP
local lspconfig = require'lspconfig'

-- Configura Pyright(Python)
lspconfig.pyright.setup{}

-- Configura Clangd (C/C++)
lspconfig.clangd.setup{}

EOF
