set autoindent
set hlsearch
set autoindent
set colorcolumn=80,120
highlight ColorColumn ctermbg=0238
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

call plug#end()
