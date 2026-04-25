-- Vim Options
vim.opt.colorcolumn={80,120}
vim.opt.diffopt = vim.opt.diffopt + 'vertical'
vim.opt.ignorecase = true -- Ignore case in search patterns
vim.opt.smartcase = true -- Don't ignore case in search patterns if uppercase character present
vim.opt.number = true -- Show line numbers
vim.opt.signcolumn = 'number' -- Display signs in number line

vim.g.mapleader = ' ' -- Space character as leader

-- Indentation

vim.opt.tabstop = 2
vim.opt.expandtab = true
vim.opt.tabstop = 2

-- Plugins
vim.pack.add({
  'https://github.com/tpope/vim-fugitive', -- Git
  'https://github.com/tpope/vim-rhubarb', -- :GBrowse
  'https://github.com/tpope/vim-surround', -- Navigation on surrounding characters
  'https://github.com/lambdalisue/vim-fern', -- Tree browser
  'https://github.com/ellisonleao/gruvbox.nvim', -- Gruvbox Theme
  'https://github.com/nvim-treesitter/nvim-treesitter', -- Syntax highlighting etc
  'https://github.com/nvim-lualine/lualine.nvim', -- Configurable status line
  'https://codeberg.org/andyg/leap.nvim', -- quick navigation
  'https://github.com/neovim/nvim-lspconfig', -- LSP support
  'https://github.com/nvim-lua/plenary.nvim', -- Helpers (used for Telescope)
  'https://github.com/nvim-telescope/telescope.nvim', -- Fuzzy finding
  'https://github.com/nvim-telescope/telescope-fzf-native.nvim', -- fzf for Telescope
})

-- Theme
require('gruvbox').setup()
vim.o.background = 'light'
vim.cmd.colorscheme('gruvbox')

vim.api.nvim_set_hl(0, 'LineNr', { bg = '#ebdbb2' })

-- Treesitter
local nts = require('nvim-treesitter')
nts.install({
  'bash',
})
vim.api.nvim_create_autocmd('PackChanged', { callback = function() nts.update() end })

-- Leap
-- press s to leap
vim.keymap.set({ 'n', 'x', 'o' }, 's', '<Plug>(leap)')

-- Lualine
require('lualine').setup({
  options = {
    icons_enabled = false,
  },
})

-- LSP
vim.lsp.enable('rust_analyzer')
vim.lsp.enable('ts_ls')
vim.lsp.enable('gopls')

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })

local actions = require('telescope.actions')
local telescope = require('telescope')
telescope.setup{
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = actions.close
      }
    }
  }
}

-- Fern
vim.keymap.set('n', '<leader><leader>', '<Cmd>Fern . -reveal=% -drawer<CR>')
