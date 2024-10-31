-- Set options
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.wildmode = { 'longest', 'list' }
vim.opt.clipboard:append('unnamedplus')
vim.opt.number = true

-- Enable syntax highlighting
vim.cmd('syntax on')

-- Load plugins using 'vim-plug'
vim.cmd [[
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
  Plug 'rebelot/kanagawa.nvim'
  Plug 'scrooloose/nerdtree'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'neovim/nvim-lspconfig'
  Plug 'williamboman/mason.nvim'
  Plug 'williamboman/mason-lspconfig.nvim'
call plug#end()
]]

-- Set colorscheme
vim.cmd('colorscheme kanagawa-dragon')

-- Key mappings
vim.api.nvim_set_keymap('n', '<C-n>', ':NERDTree<CR>', { noremap = true, silent = true })

require("mason").setup {}
require("mason-lspconfig").setup { ensure_installed = { "pyright", }, }
require 'lspconfig'.pyright.setup {}
