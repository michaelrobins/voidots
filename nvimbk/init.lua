--                              _       _ __    __
--   ____ ___ _      _______   (_)___  (_) /_  / /_  ______ _
--  / __ `__ \ | /| / / ___/  / / __ \/ / __/ / / / / / __ `/
-- / / / / / / |/ |/ / /     / / / / / / /__ / / /_/ / /_/ /
--/_/ /_/ /_/|__/|__/_/     /_/_/ /_/_/\__(_)_/\__,_/\__,_/

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ',' -- make sure to set `mapleader` before lazy so your mappings are correct

require('lazy').setup {
	{"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
	'EdenEast/nightfox.nvim',
	'numtostr/FTerm.nvim',
	'jiangmiao/auto-pairs',
	 { 'ibhagwan/fzf-lua', dependencies = { 'nvim-tree/nvim-web-devicons' }
}

}

-- require 'mwr.lsp'
require 'mwr.treesitter'
require 'mwr.cmp'
require 'mwr.nulls'
require 'mwr.snippets'
require 'mwr.lualine'
require 'mwr.fterm'
require 'mwr.lir'
require 'mwr.fzf'

-- general settings
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true
vim.cmd [[colorscheme nordfox]]
vim.cmd [[set mouse=]]
vim.opt.laststatus = 3
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
vim.opt.wildmode = 'longest:full,full'
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.showmode = false
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.scrolloff = 8
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.wrap = false
vim.o.ch = 0 -- remove empty command line space
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.signcolumn = 'yes'
vim.cmd [[set shortmess+=c]]
vim.cmd [[au FileType * set fo-=c fo-=r fo-=o]] --disable auto commment
vim.cmd [[
augroup checktime
  autocmd!
  if !has("gui_running")
    autocmd BufEnter,FocusGained,FocusLost,WinLeave * checktime
  endif
augroup END
]]
vim.cmd [[autocmd BufNewFile,BufRead *.njk setfiletype html]]

require('bufferline').setup {}

-- general maps
vim.keymap.set('n', '<leader>w', ':w<CR>', { silent = false })
vim.keymap.set('n', '<F3>', ':TSBufToggle highlight<CR>', { silent = true })
vim.keymap.set('n', '<F4>', ':set hlsearch! hlsearch?<CR>', { silent = true })
vim.keymap.set('n', '<F8>', ':PackerSync<CR>', { silent = true })
vim.keymap.set('n', '<leader>f', ':FzfLua files<CR>', { silent = true })
vim.keymap.set('n', '<leader>b', ':FzfLua buffers<CR>', { silent = true })
vim.keymap.set('n', '<leader>s', ':source $MYVIMRC<CR>', { silent = false })
vim.keymap.set('n', '<leader>e', ':TroubleToggle<CR>', { silent = true })
vim.keymap.set('n', '<leader>q', ':bd<CR>', { silent = true })
vim.keymap.set('n', '<C-P>', ':BufferLineCyclePrev<CR>', { silent = true })
vim.keymap.set('n', '<C-N>', ':BufferLineCycleNext<CR>', { silent = true })
vim.keymap.set('n', '<leader>1', ':BufferLinePick<CR>', { silent = true })
vim.keymap.set('n', '<leader>g', function()
  return require('lir.float').toggle()
end)

vim.cmd [[map <C-h> <C-w>h]]
vim.cmd [[map <C-l> <C-w>l]]
