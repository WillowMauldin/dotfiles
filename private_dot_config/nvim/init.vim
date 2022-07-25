set autoindent
set hlsearch
set autoindent
set colorcolumn=80,120
set diffopt+=vertical
set nojoinspaces
set ic

let mapleader = " "

call plug#begin()

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'https://git.sr.ht/~willdurand/srht.vim'

Plug 'vim-test/vim-test'
Plug 'pbrisbin/vim-mkdir'
Plug 'tpope/vim-surround'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'lambdalisue/fern.vim'
Plug 'prettier/vim-prettier'
Plug 'hashivim/vim-terraform'
Plug 'morhetz/gruvbox'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'junegunn/goyo.vim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'ggandor/lightspeed.nvim'

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'stevearc/dressing.nvim'

call plug#end()

" Color Scheme
if has('termguicolors')
  set termguicolors
endif

set background=dark

colorscheme gruvbox

" Treesitter
lua << EOF
require('nvim-treesitter.configs').setup {
  ensure_installed = { "typescript", "prisma", "bash", "css", "go", "html", "json", "lua", "yaml", "rust", "python" },

  highlight = {
    enable = true, -- false will disable the whole extension
  },
}
EOF

" Prettier
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0

let g:prettier#config#config_precedence = 'prefer-file'

" LSP & Completion
set completeopt=menuone,noinsert,noselect

nnoremap <leader>rn	<cmd>lua vim.lsp.buf.rename()<CR>

lua << EOF
require'lspconfig'.tsserver.setup{}
require'lspconfig'.rust_analyzer.setup({})
require'lspconfig'.pyright.setup{}
require'lspconfig'.prismals.setup({})
require'lspconfig'.gopls.setup({})
require'lspconfig'.slint_lsp.setup{}

local cmp = require'cmp'
cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    })
  },

  -- Installed sources
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }, {
    { name = 'buffer' },
  }),
})
EOF

" Code navigation shortcuts
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>Telescope lsp_implementations<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>Telescope lsp_type_definitions<CR>
nnoremap <silent> gr    <cmd>Telescope lsp_references<CR>
nnoremap <silent> g0    <cmd>Telescope document_symbol<CR>
nnoremap <silent> gW    <cmd>Telescope workspace_symbols<CR>
nnoremap <silent> gd    <cmd>Telescope lsp_definitions<CR>
nnoremap <silent> ga	<cmd>lua vim.lsp.buf.code_action()<CR>

" Set updatetime for CursorHold
" 300ms of no cursor movement to trigger CursorHold
set updatetime=300

set signcolumn=yes

" Statusline
lua << EOF
require('lualine').setup {
  options = {
    icons_enabled = false,
  },
}
EOF

" Fuzzy Finding
lua << EOF
local actions = require('telescope.actions')
local telescope = require('telescope')
telescope.load_extension('fzf')
telescope.setup{
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = actions.close
      }
    }
  }
}
EOF

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fm <cmd>Telescope marks<cr>
nnoremap <leader>fq <cmd>Telescope git_branches<cr>
nnoremap <leader>fw <cmd>Telescope git_bcommits<cr>
nnoremap <leader>fd <cmd>Telescope diagnostics<cr>
nnoremap <leader>fr <cmd>Telescope registers<cr>

autocmd User TelescopePreviewerLoaded setlocal wrap
