set autoindent
set hlsearch
set autoindent
set colorcolumn=80,120
set diffopt+=vertical
set nojoinspaces
set ic

call plug#begin()

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'https://git.sr.ht/~willdurand/srht.vim'

Plug 'vim-test/vim-test'
Plug 'pbrisbin/vim-mkdir'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-surround'
Plug 'preservim/nerdtree'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'prettier/vim-prettier'
Plug 'neovim/nvim-lspconfig'
Plug 'hashivim/vim-terraform'
Plug 'dyng/ctrlsf.vim'
Plug 'morhetz/gruvbox'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'junegunn/goyo.vim'

call plug#end()

" Color Scheme
if has('termguicolors')
  set termguicolors
endif

set background=dark
let g:everforest_background = 'hard'

colorscheme gruvbox

" Treesitter
lua << EOF
require('nvim-treesitter.configs').setup {
  ensure_installed = { "typescript" },

  highlight = {
    enable = true, -- false will disable the whole extension
  },
}
EOF

" Prettier
let g:prettier#quickfix_enabled = 0
let g:prettier#config#config_precedence = 'prefer-file'

" NERDTree
let NERDTreeShowHidden = 1

" LSP
lua << EOF
require'lspconfig'.tsserver.setup{}
EOF
